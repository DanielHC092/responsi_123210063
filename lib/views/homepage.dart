import 'package:flutter/material.dart';
import 'package:responsi_123210063_danielhanselc/views/listAgent.dart';
import 'package:responsi_123210063_danielhanselc/views/listMap.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;
  static List<Widget> _widgetOptions = [
    ListAgent(),
    ListMaps(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 20,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: 'Agent',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'Maps',
          ),
        ],
        onTap: (index) {
          setState(
            () {
              selectedIndex = index;
            },
          );
        },
        unselectedItemColor: Colors.black,
        selectedItemColor: Color(0xFF5D6BC0),
        currentIndex: selectedIndex,
      ),
    );
  }
}
