import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  String username = '';

  String password = '';

  Dashboard(this.username, this.password);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final String title = 'MainPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Sobble",
              style: Theme.of(context).textTheme.headline1,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.2 > 250
                  ? MediaQuery.of(context).size.width * 0.2
                  : 250,
              height: MediaQuery.of(context).size.height * 0.18 > 170
                  ? MediaQuery.of(context).size.height * 0.18
                  : 170,
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.height * 0.03 > 28
                      ? MediaQuery.of(context).size.height * 0.03
                      : 28),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColorLight,
                borderRadius: const BorderRadius.all(Radius.circular(5)),
              ),
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    widget.username,
                  ),
                  Text(
                    widget.password,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
