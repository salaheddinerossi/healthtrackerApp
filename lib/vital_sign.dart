import 'dart:convert';

class VitalSign {
  int timestamp;
  int heartBeat;
  double bodyTemperature;
  int bloodPressure;
  String macAddress;

  VitalSign({
    required this.timestamp,
    required this.heartBeat,
    required this.bodyTemperature,
    required this.bloodPressure,
    required this.macAddress,
  });

  String toJson() => json.encode({
    'timestamp': timestamp,
    'heartBeat': heartBeat,
    'bodyTemperature': bodyTemperature,
    'bloodPressure': bloodPressure,
    'macAddress': macAddress,
  });
}
