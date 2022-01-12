import 'package:flutter/material.dart';

import './bottom_nav_bar.dart';
import './side_nav_bar.dart';

import './bottom_nav_bar_screens/home.dart';
import './bottom_nav_bar_screens/categories.dart';
import './bottom_nav_bar_screens/vendors.dart';
import './bottom_nav_bar_screens/lists.dart';
import './bottom_nav_bar_screens/more.dart';

class Dashboard extends StatefulWidget {
  final String username;
  final String password;

  const Dashboard({Key? key, required this.username, required this.password})
      : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _selectedIndex = 0;

  final screens = [
    const Home(),
    const Vendors(),
    const Lists(),
    const Categories(),
    const More(),
  ];

  final titles = ["Home", "Vendors", "Lists", "Categories", "More"];

  void _updateIndex(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(titles[_selectedIndex]),
      ),
      bottomNavigationBar: BottomNavBar(
        updateIndex: _updateIndex,
      ),
      body: screens[_selectedIndex],
      drawer: const SideNavBar(),
    );
  }
}
