import 'package:flutter/material.dart';

import './screens/side_nav_bar_screens/about_the_app.dart';
import './screens/side_nav_bar_screens/addresses.dart';
import './screens/side_nav_bar_screens/faq.dart';
import './screens/side_nav_bar_screens/household.dart';
import './screens/side_nav_bar_screens/password.dart';
import './screens/side_nav_bar_screens/payment_methods.dart';
import './screens/side_nav_bar_screens/terms_and_conditions.dart';
import './screens/side_nav_bar_screens/user_info.dart';
import './screens/side_nav_bar_screens/contact_us.dart';
import './screens/side_nav_bar_screens/logout.dart';

// import './screens/login.dart';
import './screens/dashboard.dart';

void main() {
  runApp(const MyApp(Colors.green));
}

class MyApp extends StatelessWidget {
  final MaterialColor? mainColor;

  const MyApp(this.mainColor, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sign Up',
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        '/side_nav_bar_screen/payment_methods': (BuildContext context) =>
            const PaymentMethods(),
        '/side_nav_bar_screen/addresses': (BuildContext context) =>
            const Addresses(),
        '/side_nav_bar_screen/password': (BuildContext context) =>
            const Password(),
        '/side_nav_bar_screen/household': (BuildContext context) =>
            const Household(),
        '/side_nav_bar_screen/user_info': (BuildContext context) =>
            const UserInfo(),
        '/side_nav_bar_screen/contact_us': (BuildContext context) =>
            const ContactUs(),
        '/side_nav_bar_screen/terms_and_conditions': (BuildContext context) =>
            const TermsAndConditions(),
        '/side_nav_bar_screen/faq': (BuildContext context) => const FAQ(),
        '/side_nav_bar_screen/about_the_app': (BuildContext context) =>
            const AboutTheApp(),
        '/side_nav_bar_screen/logout': (BuildContext context) => const Logout(),
      },
      theme: ThemeData(
        primarySwatch: mainColor,
        secondaryHeaderColor: Colors.white,
        textTheme: TextTheme(
          headline1: TextStyle(
            color: mainColor,
            fontSize: 20,
          ),
          headline2: const TextStyle(
            color: Colors.black,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
          headline3: const TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
          bodyText1: TextStyle(
            color: mainColor,
            fontSize: 16,
          ),
          bodyText2: const TextStyle(
            color: Colors.black,
            fontSize: 14,
          ),
          subtitle1: const TextStyle(
            color: Colors.white,
            fontSize: 12,
          ),
          subtitle2: TextStyle(
            color: mainColor,
            fontSize: 12,
          ),
        ),
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
      ),
      home: const Dashboard(
        username: "PlaceholderUsername",
        password: "PlaceholderPassword",
      ),
    );
  }
}
