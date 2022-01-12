import 'package:flutter/material.dart';

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

class SideNavBar extends StatefulWidget {
  const SideNavBar({Key? key}) : super(key: key);

  @override
  _SideNavBarState createState() => _SideNavBarState();
}

class _SideNavBarState extends State<SideNavBar> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColorDark,
            ),
            child: Row(
              children: [
                SizedBox(
                  height: 60,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    // clipBehavior: ,
                    child: const Image(
                      image: AssetImage(
                          'assets/images/male_photo_placeholder.jpeg'),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Drawer Header',
                      style: Theme.of(context).textTheme.headline3,
                    ),
                    Text(
                      'Drawer Description',
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                  ],
                ),
              ],
            ),
          ),
          ListTile(
            title: const Text('Payment Methods'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const PaymentMethods()));
            },
          ),
          ListTile(
            title: const Text('Addresses'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Addresses()));
            },
          ),
          ListTile(
            title: const Text('Password'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Password()));
            },
          ),
          ListTile(
            title: const Text('Household'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Household()));
            },
          ),
          Divider(color: Theme.of(context).primaryColor),
          ListTile(
            title: const Text('User Info'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const UserInfo()));
            },
          ),
          ListTile(
            title: const Text('Contact Us'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const ContactUs()));
            },
          ),
          ListTile(
            title: const Text('Terms & Conditions'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const TermsAndConditions()));
            },
          ),
          ListTile(
            title: const Text('FAQ'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const FAQ()));
            },
          ),
          ListTile(
            title: const Text('About the App'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const AboutTheApp()));
            },
          ),
          ListTile(
            title: const Text('Logout'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Logout()));
            },
          ),
        ],
      ),
    );
  }
}
