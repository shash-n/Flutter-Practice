import 'dart:math';

import 'package:flutter/material.dart';

class _VendorModel {
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

  static int idGenerator = 0;
  late final int id;
  late final String name;
  late final Color color;
  bool inCart = false;
  late final int price;

  _VendorModel() {
    id = idGenerator++;
    price = Random().nextInt(100);
    name = itemNames[id % itemNames.length];
    color = Colors.primaries[id % Colors.primaries.length];
  }
}

class VendorCartModel extends ChangeNotifier {
  final List<_VendorModel> _vendors = [];

  VendorCartModel() {
    for (int i = 0; i < 15; i++) {
      _vendors.add(_VendorModel());
    }
  }

  void add(_VendorModel vendor) {
    _vendors.add(vendor);
    notifyListeners();
  }

  void removeAll() {
    _vendors.clear();
    notifyListeners();
  }

  int getVendorsCount() {
    return _vendors.length;
  }

  void changeVendorCartStatus(int id) {
    _vendors[id].inCart = !_vendors[id].inCart;
    notifyListeners();
  }

  bool isVendorInCart(int id) {
    return _vendors[id].inCart;
  }

  String getVendorName(int id) {
    return _vendors[id].name;
  }

  Color getVendorColor(int id) {
    return _vendors[id].color;
  }

  int getVendorPrice(int id) {
    return _vendors[id].price;
  }
}
