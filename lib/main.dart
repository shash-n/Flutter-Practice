import 'package:flutter/material.dart';

import './dashboard.dart';

import 'dart:convert';
import 'dart:typed_data';
import 'package:pointycastle/export.dart' as pointy_castle;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sign Up',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        secondaryHeaderColor: Theme.of(context).primaryColorDark,
        textTheme: TextTheme(
          headline1: TextStyle(
            color: Theme.of(context).primaryColorDark,
            fontSize: 20,
          ),
          headline2: const TextStyle(
            color: Colors.black,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
          bodyText1: TextStyle(
            color: Theme.of(context).primaryColorDark,
            fontSize: 16,
          ),
          bodyText2: const TextStyle(
            color: Colors.black,
            fontSize: 14,
          ),
        ),
      ),
      home: MyHomePage(title: 'Sobble'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool _emailInvalid = false;
  bool _passwordInvalid = false;
  String _emailErrorText = "";
  String _passwordErrorText = "";

  void submitData() {
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

    final sha256Digest = pointy_castle.SHA256Digest();
    final hashValue = sha256Digest
        .process(Uint8List.fromList(utf8.encode(passwordController.text)));
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                Dashboard(emailController.text, hashValue.toString())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.45 > 405
              ? MediaQuery.of(context).size.height * 0.45
              : 4,
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.height * 0.025 > 31.25
                  ? MediaQuery.of(context).size.height * 0.025
                  : 31.25),
          decoration: BoxDecoration(
              border: Border.all(
                color: Theme.of(context).secondaryHeaderColor,
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
                width: MediaQuery.of(context).size.width * 0.3 > 375
                    ? MediaQuery.of(context).size.width * 0.3
                    : 375,
                height: MediaQuery.of(context).size.height * 0.25 > 225
                    ? MediaQuery.of(context).size.height * 0.25
                    : 225,
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.height * 0.03 > 28
                        ? MediaQuery.of(context).size.height * 0.03
                        : 28),
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                        labelText: 'Email',
                        errorText: _emailInvalid ? _emailErrorText : null,
                      ),
                      controller: emailController,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5))),
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
