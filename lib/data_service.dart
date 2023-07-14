import 'dart:convert';
import 'dart:async'; 
import 'package:faker/faker.dart';
import 'package:web_socket_channel/io.dart';

class DataService {
  final String macAddress;
  late IOWebSocketChannel channel;
  final faker = Faker();

  DataService({required this.macAddress});

  void initSocketConnection() {
    channel = IOWebSocketChannel.connect('ws://34.155.181.118:8000/ws');
    
    // Listen to the stream for receiving messages
    channel.stream.listen(
      (message) {
        // handle received message
        print("Received: $message");
      },
      onError: (error, StackTrace stackTrace) {
        // error handling
        print("Error: $error");
      },
      onDone: () {
        // Handle the scenario when the connection with the server is done
        print("WebSocket connection is closed");
      },
    );

    const oneSec = Duration(seconds: 30);
    Timer.periodic(oneSec, (Timer t) => _sendData()); 
  }

  void closeSocketConnection() {
    channel.sink.close();
  }

  void _sendData() {
    final timestamp = DateTime.now().millisecondsSinceEpoch ~/ 1000;
    final bloodPressure = faker.randomGenerator.integer(122, min: 78).toString();

    final bodyTemperature = (36.5 + faker.randomGenerator.decimal() * (37.6 - 36.5)).toStringAsFixed(1);

    final heartBeat = faker.randomGenerator.integer(103, min: 58);

    final data = {
      'macAddress': macAddress,
      'timestamp': timestamp,
      'bloodPressure': bloodPressure,
      'bodyTemperature': bodyTemperature,
      'heartBeat': heartBeat
    };

    print("Sending data: ${jsonEncode(data)}");  // Print the data before sending
    channel.sink.add(json.encode(data));
  }
}
