// ignore_for_file: avoid_print, deprecated_member_use

import 'package:digi_farmers/models/weights.dart';
import 'package:flutter/foundation.dart';
import 'package:isoweek/isoweek.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class DatabaseService {
  static Future<String> fetchUserId() async {
    final user = Supabase.instance.client.auth.currentUser;
    return (await Supabase.instance.client
        .from('Farmers')
        .select('farmer_id')
        .eq('auth_id', user?.id))[0]["farmer_id"];
  }

  //fetch data
  static void fetchData(
      ValueNotifier<List<WeightData>> weightData, String userId, Week week) {
    try {
      Supabase.instance.client
          .from('Produce')
          .select('weight,timestamp')
          .eq('farmer_id', userId)
          .lte("timestamp", week.day(6).toIso8601String())
          .gte("timestamp", week.day(0).toIso8601String())
          .order('timestamp', ascending: false)
          .then((data) => weightData.value = (data as List)
              .map((data) => WeightData(
                  weight: double.parse(data['weight'].toString()),
                  dateTime: DateTime.parse(data['timestamp'])))
              .toList());
    } on PostgrestException catch (e) {
      print(e.message.toString());
    }
  }

  static ValueNotifier<List<WeightData>> fetchUpdates(
      ValueNotifier<List<WeightData>> weightData, String userId, Week week) {
    fetchData(weightData, userId, week);
    Supabase.instance.client
        .channel('db-changes')
        .on(
            RealtimeListenTypes.postgresChanges,
            ChannelFilter(
              event: '*',
              schema: 'public',
              table: 'Produce',
              filter: 'farmer_id=eq.$userId',
            ),
            (payload, [ref]) => fetchData(weightData, userId, week))
        .subscribe();
    return weightData;
  }
}
