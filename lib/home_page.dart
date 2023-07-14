import 'package:flutter/material.dart';
import '/data_service.dart';
import 'package:flutter/services.dart';  // Import services

class HomePage extends StatefulWidget {
  final String macAddress;

  const HomePage({Key? key, required this.macAddress}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {
  late DataService dataService;

  @override
  void initState() {
    super.initState();
    dataService = DataService(macAddress: widget.macAddress);
    dataService.initSocketConnection();
  }

  @override
  void dispose() {
    dataService.closeSocketConnection();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WebSocket Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Sending da data...'),
            ElevatedButton(
              child: Text('Stop'),
              onPressed: () {
                dataService.closeSocketConnection();
                SystemNavigator.pop();  // Add this line
              },
            ),
          ],
        ),
      ),
    );
  }
}
