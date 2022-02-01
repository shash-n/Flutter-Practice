import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../models/vendors_catalog_model.dart';

class Vendors extends StatefulWidget {
  const Vendors({Key? key}) : super(key: key);

  final String title = "Vendors";

  @override
  State<Vendors> createState() => _VendorsState();
}

class _VendorsState extends State<Vendors> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 15,
        itemBuilder: (BuildContext context, int index) {
          // print(index);
          return Vendor();
        },
      ),
    );
  }
}

class Vendor extends StatefulWidget {
  final int id = Random().nextInt(10);

  Vendor({Key? key}) : super(key: key);

  @override
  State<Vendor> createState() => _VendorState();
}

class _VendorState extends State<Vendor> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      margin: const EdgeInsets.all(20),
      child: Consumer<VendorModel>(
        builder: (context, vendorModel, child) {
          return TextButton(
            onPressed: vendorModel.changeCartStatus,
            style: ButtonStyle(
              elevation: MaterialStateProperty.all<double>(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 50,
                  height: 50,
                  child: ColoredBox(
                    color: vendorModel.color,
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        vendorModel.name,
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        vendorModel.price.toString(),
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                      )
                    ],
                  ),
                ),
                vendorModel.inCart
                    ? const Icon(Icons.ice_skating)
                    : const Text(
                        "BUY",
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
              ],
            ),
          );
        },
      ),
    );
  }
}
