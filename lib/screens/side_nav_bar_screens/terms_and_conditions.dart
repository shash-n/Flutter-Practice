import 'package:flutter/material.dart';

class TermsAndConditions extends StatefulWidget {
  const TermsAndConditions({Key? key}) : super(key: key);

  final String title = "Terms and Conditions";

  @override
  State<TermsAndConditions> createState() => _TermsAndConditionsState();
}

class _TermsAndConditionsState extends State<TermsAndConditions> {
  @override
  Widget build(BuildContext context) {
    return Center(
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
    );
  }
}
