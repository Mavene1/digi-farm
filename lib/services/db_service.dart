// ignore_for_file: avoid_print, deprecated_member_use

import 'package:supabase_flutter/supabase_flutter.dart';

class DatabaseService {
  //fetch data
  Future fetchData() async {
    try {
      var response = await Supabase.instance.client
          .from('Produce')
          .select('farmer_id')
          .execute();
      print(response.data);
    } on PostgrestException catch (e) {
      print(e.message.toString());
    }
  }
}
