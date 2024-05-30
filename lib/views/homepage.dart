import 'package:flutter/material.dart';
import 'package:responsi_123210063_danielhanselc/views/listAgent.dart';
import 'package:responsi_123210063_danielhanselc/views/listMap.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main Page'),
        backgroundColor: Colors.redAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ListAgent(),
                  ),
                );
              },
              icon: Icon(Icons.person),
              label: Text(
                'Agent',
                style: TextStyle(fontSize: 30),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent,
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MapListPage(),
                  ),
                );
              },
              icon: Icon(Icons.map),
              label: Text(
                'Maps',
                style: TextStyle(fontSize: 30),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
