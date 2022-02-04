import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './models/vendors_cart_model.dart';
// import './screens/login.dart';
import './screens/dashboard.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => VendorCartModel()),
      ],
      child: const MyApp(Colors.green),
    ),
  );
}

class MyApp extends StatelessWidget {
  final MaterialColor? mainColor;

  const MyApp(this.mainColor, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sign Up',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: mainColor,
        secondaryHeaderColor: Colors.white,
        textTheme: TextTheme(
          headline1: TextStyle(
            color: mainColor,
            fontSize: 20,
          ),
          headline2: const TextStyle(
            color: Colors.black,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
          headline3: const TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
          headline4: const TextStyle(),
          bodyText1: TextStyle(
            color: mainColor,
            fontSize: 16,
          ),
          bodyText2: const TextStyle(
            color: Colors.black,
            fontSize: 14,
          ),
          subtitle1: const TextStyle(
            color: Colors.white,
            fontSize: 12,
          ),
          subtitle2: TextStyle(
            color: mainColor,
            fontSize: 12,
          ),
        ),
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
      ),
      home:
          // const Login(),
          const Dashboard(
              username: "PlaceholderUsername", password: "PlaceholderPassword"),
    );
  }
}
