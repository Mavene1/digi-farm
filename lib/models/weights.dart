// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class WeightData {
  final double weight;
  final DateTime dateTime;

  WeightData({
    required this.weight,
    required this.dateTime,
  });

  WeightData copyWith({
    double? weight,
    DateTime? dateTime,
  }) {
    return WeightData(
      weight: weight ?? this.weight,
      dateTime: dateTime ?? this.dateTime,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'weight': weight,
      'dateTime': dateTime.millisecondsSinceEpoch,
    };
  }

  factory WeightData.fromMap(Map<String, dynamic> map) {
    return WeightData(
      weight: map['weight'] as double,
      dateTime: DateTime.fromMillisecondsSinceEpoch(map['dateTime'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory WeightData.fromJson(String source) =>
      WeightData.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'WeightData(weight: $weight, dateTime: $dateTime)';

  @override
  bool operator ==(covariant WeightData other) {
    if (identical(this, other)) return true;

    return other.weight == weight && other.dateTime == dateTime;
  }

  @override
  int get hashCode => weight.hashCode ^ dateTime.hashCode;
}
