import 'package:flutter/material.dart';
import '/home_page.dart';

class MacAddressInputPage extends StatefulWidget {
  const MacAddressInputPage({Key? key}) : super(key: key);

  @override
  _MacAddressInputPageState createState() => _MacAddressInputPageState();
}

class _MacAddressInputPageState extends State<MacAddressInputPage> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Enter MAC Address'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _controller,
              decoration: InputDecoration(labelText: 'MAC Address'),
            ),
            ElevatedButton(
              child: Text('Submit'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePage(macAddress: _controller.text),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
