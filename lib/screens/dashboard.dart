import 'package:flutter/material.dart';

import './bottom_nav_bar.dart';
import './side_nav_bar.dart';

import './bottom_nav_bar_screens/home.dart';
import './bottom_nav_bar_screens/categories.dart';
import './bottom_nav_bar_screens/vendors.dart';
import './bottom_nav_bar_screens/lists.dart';
import './bottom_nav_bar_screens/more.dart';

import './side_nav_bar_screens/about_the_app.dart';
import './side_nav_bar_screens/addresses.dart';
import './side_nav_bar_screens/faq.dart';
import './side_nav_bar_screens/household.dart';
import './side_nav_bar_screens/password.dart';
import './side_nav_bar_screens/payment_methods.dart';
import './side_nav_bar_screens/terms_and_conditions.dart';
import './side_nav_bar_screens/user_info.dart';
import './side_nav_bar_screens/contact_us.dart';
import './side_nav_bar_screens/logout.dart';

class Dashboard extends StatefulWidget {
  final String username;
  final String password;

  const Dashboard({Key? key, required this.username, required this.password})
      : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _bottomNavBarSelectedIndex = 0;
  int _sideNavBarSelectedIndex = -1;
  final int bottomScreensCount = 5;

  final screens = [
    const Home(),
    const Vendors(),
    const Lists(),
    const Categories(),
    const More(),
    const PaymentMethods(),
    const Addresses(),
    const Password(),
    const Household(),
    const UserInfo(),
    const ContactUs(),
    const TermsAndConditions(),
    const FAQ(),
    const AboutTheApp(),
    const Logout(),
  ];

  final titles = [
    "Home",
    "Vendors",
    "Your Shopping Lists",
    "Categories",
    "More",
    "Payment Methods",
    "Addresses",
    "Password",
    "Household",
    "User info",
    "Contact Us",
    "Terms & Conditions",
    "FAQ",
    "About the App",
    "Logout",
  ];

  void _updateBottomNavBarScreenIndex(int index) {
    setState(() {
      _bottomNavBarSelectedIndex = index;
      _sideNavBarSelectedIndex = -1;
    });
  }

  void _updateSideNavBarScreenIndex(int index) {
    setState(() {
      _sideNavBarSelectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_sideNavBarSelectedIndex < 0
            ? titles[_bottomNavBarSelectedIndex]
            : titles[bottomScreensCount + _sideNavBarSelectedIndex]),
      ),
      bottomNavigationBar: BottomNavBar(
        updateIndex: _updateBottomNavBarScreenIndex,
      ),
      body: _sideNavBarSelectedIndex < 0
          ? screens[_bottomNavBarSelectedIndex]
          : screens[bottomScreensCount + _sideNavBarSelectedIndex],
      drawer: SideNavBar(
        updateIndex: _updateSideNavBarScreenIndex,
      ),
    );
  }
}
