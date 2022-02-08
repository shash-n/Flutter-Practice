import 'package:flutter/material.dart';

import '../bottom_nav_bar/bottom_nav_bar.dart';
import '../side_nav_bar/side_nav_bar.dart';

import '../bottom_nav_bar/home.dart';
import '../bottom_nav_bar/categories.dart';
import '../bottom_nav_bar/vendors/vendors.dart';
import '../bottom_nav_bar/lists/lists.dart';
import '../bottom_nav_bar/more.dart';

import '../side_nav_bar/about_the_app.dart';
import '../side_nav_bar/addresses.dart';
import '../side_nav_bar/faq.dart';
import '../side_nav_bar/household.dart';
import '../side_nav_bar/password.dart';
import '../side_nav_bar/payment_methods.dart';
import '../side_nav_bar/terms_and_conditions.dart';
import '../side_nav_bar/user_info.dart';
import '../side_nav_bar/contact_us.dart';
import '../side_nav_bar/logout.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _bottomNavBarSelectedIndex = 0;
  int _sideNavBarSelectedIndex = -1;
  final int bottomScreensCount = 5;

  final screens = const [
    Home(),
    Vendors(),
    Lists(),
    Categories(),
    More(),
    PaymentMethods(),
    Addresses(),
    Password(),
    Household(),
    UserInfo(),
    ContactUs(),
    TermsAndConditions(),
    FAQ(),
    AboutTheApp(),
    Logout(),
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
