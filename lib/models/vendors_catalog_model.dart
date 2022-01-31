import 'dart:math';

import 'package:flutter/material.dart';

class VendorModel extends ChangeNotifier {
  static List<String> itemNames = [
    'Code Smell',
    'Control Flow',
    'Interpreter',
    'Recursion',
    'Sprint',
    'Heisenbug',
    'Spaghetti',
    'Hydra Code',
    'Off-By-One',
    'Scope',
    'Callback',
    'Closure',
    'Automata',
    'Bit Shift',
    'Currying',
  ];

  late final String name;
  late final Color color;
  bool inCart = false;
  late final int price;

  VendorModel() {
    int id = Random().nextInt(10);
    price = Random().nextInt(100);
    name = itemNames[id % itemNames.length];
    color = Colors.primaries[id % Colors.primaries.length];
  }

  void changeCartStatus() {
    inCart = !inCart;
    notifyListeners();
  }
}
