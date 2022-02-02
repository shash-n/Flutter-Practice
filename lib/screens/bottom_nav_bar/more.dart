import 'package:flutter/material.dart';

import 'package:webview_flutter/webview_flutter.dart';

class More extends StatefulWidget {
  const More({Key? key}) : super(key: key);

  final String title = "More";

  @override
  State<More> createState() => _MoreState();
}

class _MoreState extends State<More> {
  @override
  Widget build(BuildContext context) {
    return const WebView(
      initialUrl: 'https://flutter.dev',
    );
  }
}
