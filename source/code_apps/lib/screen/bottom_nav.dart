import 'package:code_apps/screen/all_message.dart';
import 'package:code_apps/screen/gambar.dart';
import 'package:code_apps/screen/pesan.dart';
import 'package:flutter/material.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _currentIndex = 0;
  final List<Widget> bodyNav = [
    AllMessage(),
    Pesan(),
    Gambar(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Code Challenge"),
      ),
      body: bodyNav[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.message), label: "Pesan"),
          BottomNavigationBarItem(icon: Icon(Icons.photo), label: "Gambar"),
        ],
        onTap: (val) {
          setState(() {
            _currentIndex = val;
          });
        },
      ),
    );
  }
}
