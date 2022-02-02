import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../models/vendors_cart_model.dart';

import '../vendors/vendors_cart.dart';

class Vendors extends StatefulWidget {
  const Vendors({Key? key}) : super(key: key);

  final String title = "Vendors";

  @override
  State<Vendors> createState() => _VendorsState();
}

class _VendorsState extends State<Vendors> {
  void goToCart() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const VendorsCart()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<VendorCartModel>(
        builder: (context, cart, child) {
          return ListView.builder(
            shrinkWrap: true,
            itemCount: cart.getVendorsCount(),
            itemBuilder: (BuildContext context, int index) {
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Theme.of(context).primaryColor,
                ),
                margin:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: TextButton(
                  onPressed: () {
                    cart.changeVendorCartStatus(index);
                  },
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
                          color: cart.getVendorColor(index),
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
                              cart.getVendorName(index),
                              style: const TextStyle(
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              cart.getVendorPrice(index).toString(),
                              style: const TextStyle(
                                color: Colors.black,
                              ),
                            )
                          ],
                        ),
                      ),
                      cart.isVendorInCart(index)
                          ? const Icon(Icons.ice_skating)
                          : const Text(
                              "BUY",
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                      const SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: goToCart,
        label: const Text("Cart"),
        icon: const Icon(Icons.wallet_giftcard),
      ),
    );
  }
}
