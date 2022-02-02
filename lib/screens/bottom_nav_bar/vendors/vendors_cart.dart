import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../models/vendors_cart_model.dart';

class VendorsCart extends StatefulWidget {
  const VendorsCart({Key? key}) : super(key: key);

  final String title = "Your Cart";

  @override
  State<VendorsCart> createState() => _VendorsCartState();
}

class _VendorsCartState extends State<VendorsCart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        padding: const EdgeInsets.all(30),
        child: Consumer<VendorCartModel>(
          builder: (context, cart, child) {
            return ListView.builder(
              shrinkWrap: true,
              itemCount: cart.getVendorsCount(),
              itemBuilder: (BuildContext context, int index) {
                return cart.isVendorInCart(index)
                    ? Text(cart.getVendorName(index))
                    : const Text("");
              },
            );
          },
        ),
      ),
    );
  }
}
