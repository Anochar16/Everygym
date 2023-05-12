
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:everygym/states/page_navigator_navbar/report.dart';
import 'package:everygym/states/page_navigator_navbar/trainning_page.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  final tab = [Trainning(), Report()];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: tab[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          backgroundColor: Colors.black,
          fixedColor: Colors.amber,
          unselectedItemColor: Colors.white,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_max_outlined),
                label: 'Trainning',
                backgroundColor: Colors.amber),
            BottomNavigationBarItem(
                icon: Icon(Icons.report_outlined),
                label: 'Report',
                backgroundColor: Color.fromARGB(255, 255, 255, 255),
                ),
          ],
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
        ));
  }
}
