import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  final String title = "Home";

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  static const baseURL =
      "https://e3-qkmountain.qkinnovations.com/qkm-andermatt-backend/api/";
  static const postsEndpoint = baseURL + "user/appLogin";
  int deviceToken = 1;
  String? deviceType = "A";
  int categoryId = 2;

  Future<String> fetchAlbum() async {
    final url = Uri.parse(postsEndpoint);
    final response = await http.post(url,
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          'email': emailController.text,
          'password': passwordController.text,
          'device_token': deviceToken,
          'device_type': deviceType,
          'category_id': categoryId
        }));
    return response.body;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(fetchAlbum().toString()),
    );
  }
}
