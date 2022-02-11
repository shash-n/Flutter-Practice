import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/vendors_cart_model.dart';

// import './login/login.dart';
import './dashboard/dashboard.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

const AndroidNotificationChannel channel = AndroidNotificationChannel(
    'high_importance_channel', 'High Importance Notifications',
    description: 'This channel is used for important notifications.',
    importance: Importance.high,
    playSound: true);

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  debugPrint('A bg message just showed up: ${message.messageId}');
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => VendorCartModel()),
      ],
      child: const MyApp(Colors.green),
    ),
  );
}

class MyApp extends StatefulWidget {
  final MaterialColor? mainColor;

  const MyApp(this.mainColor, {Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null) {
        flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
              android: AndroidNotificationDetails(
                channel.id,
                channel.name,
                channelDescription: channel.description,
                color: Colors.green,
                playSound: true,
              ),
            ));
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      debugPrint("A new onMessageOpenedApp event was published!");
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null) {
        showDialog(
          context: context,
          builder: (_) {
            return AlertDialog(
              title: Text(notification.title.toString()),
              content: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(notification.body.toString()),
                  ],
                ),
              ),
            );
          },
        );
      }
    });
  }

  void showNotification() {
    setState(() {
      _counter += 1;
    });
    flutterLocalNotificationsPlugin.show(
      0,
      "Testing $_counter",
      "How are you?",
      NotificationDetails(
          android: AndroidNotificationDetails(channel.id, channel.name,
              channelDescription: channel.description,
              importance: Importance.high,
              color: Colors.blue,
              playSound: true)),
    );
  }

  void playAudio() async {
    AudioPlayer audioPlayer = AudioPlayer();
    await audioPlayer.play(
        'https://luan.xyz/files/audio/nasa_on_a_mission.mp3'); //http://sndup.net/tnpr');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sign Up',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: widget.mainColor,
        secondaryHeaderColor: Colors.white,
        textTheme: TextTheme(
          headline1: TextStyle(
            color: widget.mainColor,
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
            color: widget.mainColor,
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
            color: widget.mainColor,
            fontSize: 12,
          ),
        ),
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
      ),
      home: Scaffold(
        body: Center(
          child: Text(_counter.toString()),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: showNotification,
          tooltip: "Show Notifications",
          child: const Icon(Icons.add),
        ),
      ),
      // const Login(),
      // const Dashboard(),
    );
  }
}
