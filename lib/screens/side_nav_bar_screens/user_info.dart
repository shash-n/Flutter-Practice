import 'package:flutter/material.dart';

class UserInfo extends StatefulWidget {
  const UserInfo({Key? key}) : super(key: key);

  final String title = "User info";

  @override
  State<UserInfo> createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.45,
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.height * 0.025),
          decoration: BoxDecoration(
              border: Border.all(
                color: Theme.of(context).primaryColorDark,
                width: 2,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(10))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(widget.title),
            ],
          ),
        ),
      ),
    );
  }
}
