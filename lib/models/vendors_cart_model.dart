import 'dart:collection';

import 'package:flutter/material.dart';

import '../screens/bottom_nav_bar/vendors/vendors.dart';

class VendorCartModel extends ChangeNotifier {
  final List<Vendor> _vendors = [];

  UnmodifiableListView<Vendor> get item => UnmodifiableListView(_vendors);

  int get totalPrice => _vendors.length * 42;

  void add(Vendor vendor) {
    _vendors.add(vendor);
    notifyListeners();
  }

  void removeAll() {
    _vendors.clear();
    notifyListeners();
  }
}
