import 'package:flutter/material.dart';

class SideNavBar extends StatefulWidget {
  final ValueChanged<int> updateIndex;

  const SideNavBar({Key? key, required this.updateIndex}) : super(key: key);

  @override
  _SideNavBarState createState() => _SideNavBarState();
}

class _SideNavBarState extends State<SideNavBar> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Theme.of(context).primaryColor,
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
              leading: const Icon(Icons.paid),
              minLeadingWidth: 0,
              textColor: Theme.of(context).secondaryHeaderColor,
              iconColor: Theme.of(context).secondaryHeaderColor,
              title: const Text('Payment Methods'),
              onTap: () {
                Navigator.pop(context);
                widget.updateIndex(0);
              },
            ),
            ListTile(
              leading: const Icon(Icons.location_pin),
              minLeadingWidth: 0,
              textColor: Theme.of(context).secondaryHeaderColor,
              iconColor: Theme.of(context).secondaryHeaderColor,
              title: const Text('Addresses'),
              onTap: () {
                Navigator.pop(context);
                widget.updateIndex(1);
              },
            ),
            ListTile(
              leading: const Icon(Icons.lock),
              minLeadingWidth: 0,
              textColor: Theme.of(context).secondaryHeaderColor,
              iconColor: Theme.of(context).secondaryHeaderColor,
              title: const Text('Password'),
              onTap: () {
                Navigator.pop(context);
                widget.updateIndex(2);
              },
            ),
            ListTile(
              leading: const Icon(Icons.people),
              minLeadingWidth: 0,
              textColor: Theme.of(context).secondaryHeaderColor,
              iconColor: Theme.of(context).secondaryHeaderColor,
              title: const Text('Household'),
              onTap: () {
                Navigator.pop(context);
                widget.updateIndex(3);
              },
            ),
            Divider(
              color: Theme.of(context).secondaryHeaderColor,
              endIndent: 70,
              indent: 20,
            ),
            ListTile(
              leading: const Icon(Icons.info),
              minLeadingWidth: 0,
              textColor: Theme.of(context).secondaryHeaderColor,
              iconColor: Theme.of(context).secondaryHeaderColor,
              title: const Text('User Info'),
              onTap: () {
                Navigator.pop(context);
                widget.updateIndex(4);
              },
            ),
            ListTile(
              leading: const Icon(Icons.message_rounded),
              minLeadingWidth: 0,
              textColor: Theme.of(context).secondaryHeaderColor,
              iconColor: Theme.of(context).secondaryHeaderColor,
              title: const Text('Contact Us'),
              onTap: () {
                Navigator.pop(context);
                widget.updateIndex(5);
              },
            ),
            ListTile(
              leading: const Icon(Icons.library_books),
              minLeadingWidth: 0,
              textColor: Theme.of(context).secondaryHeaderColor,
              iconColor: Theme.of(context).secondaryHeaderColor,
              title: const Text('Terms & Conditions'),
              onTap: () {
                Navigator.pop(context);
                widget.updateIndex(6);
              },
            ),
            ListTile(
              leading: const Icon(Icons.question_answer_rounded),
              minLeadingWidth: 0,
              textColor: Theme.of(context).secondaryHeaderColor,
              iconColor: Theme.of(context).secondaryHeaderColor,
              title: const Text('FAQ'),
              onTap: () {
                Navigator.pop(context);
                widget.updateIndex(7);
              },
            ),
            ListTile(
              leading: const Icon(Icons.app_settings_alt),
              minLeadingWidth: 0,
              textColor: Theme.of(context).secondaryHeaderColor,
              iconColor: Theme.of(context).secondaryHeaderColor,
              title: const Text('About the App'),
              onTap: () {
                Navigator.pop(context);
                widget.updateIndex(8);
              },
            ),
            ListTile(
              leading: const Icon(Icons.exit_to_app_rounded),
              minLeadingWidth: 0,
              textColor: Theme.of(context).secondaryHeaderColor,
              iconColor: Theme.of(context).secondaryHeaderColor,
              title: const Text('Logout'),
              onTap: () {
                Navigator.pop(context);
                widget.updateIndex(9);
              },
            ),
          ],
        ),
      ),
    );
  }
}
