import 'package:flutter/material.dart';

class More extends StatefulWidget {
  const More({Key? key}) : super(key: key);

  final String title = "More";

  @override
  State<More> createState() => _MoreState();
}

class _MoreState extends State<More> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
