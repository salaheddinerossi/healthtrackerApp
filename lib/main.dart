import 'package:flutter/material.dart';
import '/mac_address_input_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WebSocket Demon',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MacAddressInputPage(),
    );
  }
}
