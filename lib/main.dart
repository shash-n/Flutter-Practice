import 'package:flutter/material.dart';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import './screens/side_nav_bar_screens/about_the_app.dart';
import './screens/side_nav_bar_screens/addresses.dart';
import './screens/side_nav_bar_screens/faq.dart';
import './screens/side_nav_bar_screens/household.dart';
import './screens/side_nav_bar_screens/password.dart';
import './screens/side_nav_bar_screens/payment_methods.dart';
import './screens/side_nav_bar_screens/terms_and_conditions.dart';
import './screens/side_nav_bar_screens/user_info.dart';
import './screens/side_nav_bar_screens/contact_us.dart';
import './screens/side_nav_bar_screens/logout.dart';

// import './screens/login.dart';
import './screens/dashboard.dart';

void main() async {
  runApp(const MyApp(Colors.green));
}

class MyApp extends StatelessWidget {
  final MaterialColor? mainColor;

  const MyApp(this.mainColor, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sign Up',
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        '/side_nav_bar_screen/payment_methods': (BuildContext context) =>
            const PaymentMethods(),
        '/side_nav_bar_screen/addresses': (BuildContext context) =>
            const Addresses(),
        '/side_nav_bar_screen/password': (BuildContext context) =>
            const Password(),
        '/side_nav_bar_screen/household': (BuildContext context) =>
            const Household(),
        '/side_nav_bar_screen/user_info': (BuildContext context) =>
            const UserInfo(),
        '/side_nav_bar_screen/contact_us': (BuildContext context) =>
            const ContactUs(),
        '/side_nav_bar_screen/terms_and_conditions': (BuildContext context) =>
            const TermsAndConditions(),
        '/side_nav_bar_screen/faq': (BuildContext context) => const FAQ(),
        '/side_nav_bar_screen/about_the_app': (BuildContext context) =>
            const AboutTheApp(),
        '/side_nav_bar_screen/logout': (BuildContext context) => const Logout(),
      },
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
      home: const Dashboard(
        username: "PlaceholderUsername",
        password: "PlaceholderPassword",
      ),
    );
  }
}

class ListDatabaseHelper {
  static late ListDatabaseHelper _listDatabaseHelper;
  static late Database _listDatabase;
  static const _databaseName = "lists.db";
  static const _databaseVersion = 1;

  static const tables = ['lists', 'items'];

  static const columnId = 'id';
  static const columnName = 'name';
  static const columnMiles = 'miles';

  ListDatabaseHelper._createInstance();
  factory ListDatabaseHelper() {
    // if (_listDatabaseHelper == null) {
    //   _listDatabaseHelper = ListDatabaseHelper._createInstance();
    // }
    return _listDatabaseHelper;
  }

  Future<Database> get database async =>
      _listDatabase ??= await _initDatabase();

  _initDatabase() async {
    String path = join(await getDatabasesPath(), _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    for (int i = 0; i < tables.length; i++) {
      await db.execute('''
          CREATE TABLE ${tables[i]} (
            $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
            $columnName TEXT NOT NULL,
            $columnMiles INTEGER NOT NULL
          )
          ''');
    }
  }

  Future<int> insertItem(Item item) async {
    Database db = await instance.database;
    return await db.insert(
      'items',
      {
        'id': item.id,
        'name': item.name,
        'quantity': item.quantity,
        'price': item.price,
        'description': item.description
      },
    );
  }

  Future<int> updateItem(Item item) async {
    Database db = await instance.database;
    int id = item.toMap()['id'];
    return await db
        .update('items', item.toMap(), where: '$columnId = ?', whereArgs: [id]);
  }

  Future<int> deleteItem(int id) async {
    Database db = await instance.database;
    return await db.delete('items', where: '$columnId = ?', whereArgs: [id]);
  }

  Future<List<Map<String, dynamic>>> queryAllItems() async {
    Database db = await instance.database;
    return await db.query('items');
  }

  Future<List<Map<String, dynamic>>> queryItems(name) async {
    Database db = await instance.database;
    return await db.query('items', where: "$columnName LIKE '%$name%'");
  }

  // Future<int> queryItemCount() async {
  //   Database db = await instance.database;
  //   return Sqflite.firstIntValue(
  //       await db.rawQuery('SELECT COUNT(*) FROM items'));
  // }
}

class UList {
  final int id;
  final String name;
  final String type;
  final int totalItems;
  final int totalAmount;

  UList({
    required this.id,
    required this.name,
    required this.type,
    required this.totalItems,
    required this.totalAmount,
  });
}

class Item {
  final int id;
  final String name;
  final int quantity;
  final int price;
  final String description;

  Item({
    required this.id,
    required this.name,
    required this.quantity,
    required this.price,
    required this.description,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'quantity': quantity,
      'price': price,
      'description': description,
    };
  }

  @override
  String toString() {
    return 'Dog{id: $id, name: $name, quantity: $quantity, price: $price, description: $description}';
  }
}

class ListItemRelation {
  final int id;
  final int itemId;
  final int listId;
  final int itemQuantity;

  ListItemRelation({
    required this.id,
    required this.itemId,
    required this.listId,
    required this.itemQuantity,
  });
}
