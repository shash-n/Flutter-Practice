import 'package:flutter/material.dart';

import 'dashboard.dart';

import 'dart:convert';

import 'package:http/http.dart' as http;

// import 'dart:typed_data';
// import 'package:pointycastle/export.dart' as pointy_castle;

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  final String title = "Login";

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final emailController = TextEditingController(text: "");
  final passwordController = TextEditingController(text: "");

  bool _emailInvalid = false;
  bool _passwordInvalid = false;
  String _emailErrorText = "";
  String _passwordErrorText = "";

  static const baseURL =
      "https://e3-qkmountain.qkinnovations.com/qkm-andermatt-backend/api/";
  static const postsEndpoint = baseURL + "user/appLogin";
  int deviceToken = 1;
  String? deviceType = "A";
  int categoryId = 2;

  void submitData() async {
    RegExp _emailRegExp = RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z.-]+.[a-zA-Z]+\$");
    RegExp _passwordRegExp = RegExp("^[a-zA-Z0-9!@#%^&*(){};:'\",><.\\/-_]+\$");

    if (!emailController.text.isNotEmpty) {
      setState(() {
        _emailErrorText = "This field can't be empty!";
        _emailInvalid = true;
      });
    } else if (!_emailRegExp.hasMatch(emailController.text)) {
      setState(() {
        _emailErrorText = "Couldn't find your Sobble Account";
        _emailInvalid = true;
      });
    } else {
      setState(() {
        _emailErrorText = "";
        _emailInvalid = false;
      });
    }

    if (!passwordController.text.isNotEmpty) {
      setState(() {
        _passwordErrorText = "This field can't be empty!";
        _passwordInvalid = true;
      });
    } else if (!_passwordRegExp.hasMatch(passwordController.text)) {
      setState(() {
        _passwordErrorText = "Wrong password. Try again.";
        _passwordInvalid = true;
      });
    } else {
      setState(() {
        _passwordErrorText = "";
        _passwordInvalid = false;
      });
    }

    if (_emailInvalid || _passwordInvalid) {
      return;
    }

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

    // final sha256Digest = pointy_castle.SHA256Digest();
    // final hashValue = sha256Digest
    //     .process(Uint8List.fromList(utf8.encode(passwordController.text)));

    final jsonInfo = jsonDecode(response.body);
    if (jsonInfo["message"] == "success") {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Dashboard(
                  username: emailController.text,
                  password: passwordController.text)));
    }
  }

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
              horizontal: MediaQuery.of(context).size.height * 0.02),
          decoration: BoxDecoration(
              border: Border.all(
                color: Theme.of(context).primaryColorDark,
                width: 2,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(10))),
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
              Text(
                "Sign in",
                style: Theme.of(context).textTheme.headline2,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              Text(
                "to continue to Sobble",
                style: Theme.of(context).textTheme.bodyText2,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.7,
                height: MediaQuery.of(context).size.height * 0.25,
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.height * 0.03),
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      style: const TextStyle(
                        color: Colors.black,
                      ),
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                        ),
                        labelText: 'Email',
                        errorText: _emailInvalid ? _emailErrorText : null,
                      ),
                      controller: emailController,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    TextFormField(
                      style: const TextStyle(
                        color: Colors.black,
                      ),
                      obscureText: true,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                        ),
                        labelText: 'Password',
                        errorText: _passwordInvalid ? _passwordErrorText : null,
                      ),
                      controller: passwordController,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    Container(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Theme.of(context).primaryColorLight,
                        ),
                        child: Text(
                          "Next",
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        onPressed: submitData,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
