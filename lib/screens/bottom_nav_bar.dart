import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  final ValueChanged<int> updateIndex;

  const BottomNavBar({Key? key, required this.updateIndex}) : super(key: key);

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home_filled),
          label: 'HOME',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.people),
          label: 'VENDORS',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.view_list),
          label: 'LISTS',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.grid_view_rounded),
          label: 'CATEGORIES',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add),
          label: 'MORE',
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Theme.of(context).primaryColorDark,
      unselectedItemColor: Theme.of(context).primaryColor,
      onTap: (index) {
        widget.updateIndex(index);
        setState(() {
          _selectedIndex = index;
        });
      },
    );
  }
}
