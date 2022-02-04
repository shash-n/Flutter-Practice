import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../models/vendors_cart_model.dart';
import '../vendors/vendors_cart.dart';
import '../vendors/skeleton_container.dart';

class Vendors extends StatefulWidget {
  const Vendors({Key? key}) : super(key: key);

  final String title = "Vendors";

  @override
  State<Vendors> createState() => _VendorsState();
}

class _VendorsState extends State<Vendors> {
  bool loading = false;

  void goToCart() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const VendorsCart()));
  }

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async {
    setState(() {
      loading = true;
    });

    await Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        loading = false;
      });
    });
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
              return loading ? buildSkeleton() : buildResult(cart, index);
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

  Widget buildSkeleton() => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Theme.of(context).primaryColor,
        ),
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: TextButton(
          onPressed: () {},
          style: ButtonStyle(
            elevation: MaterialStateProperty.all<double>(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SkeletonContainer.square(
                width: 50,
                height: 50,
                margin: EdgeInsets.only(right: 10),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SkeletonContainer.square(
                      width: MediaQuery.of(context).size.width * 0.3,
                      height: 16,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    SkeletonContainer.square(
                      width: MediaQuery.of(context).size.width * 0.05,
                      height: 16,
                    ),
                  ],
                ),
              ),
              SkeletonContainer.square(
                height: 30,
                width: MediaQuery.of(context).size.width * 0.07,
                margin: const EdgeInsets.only(right: 10),
              ),
            ],
          ),
        ),
      );

  Widget buildResult(cart, index) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Theme.of(context).primaryColor,
        ),
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
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
              Container(
                width: 50,
                height: 50,
                margin: const EdgeInsets.only(right: 10),
                child: ColoredBox(
                  color: cart.getVendorColor(index),
                ),
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
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      cart.getVendorPrice(index).toString(),
                      style: const TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(right: 10),
                child: cart.isVendorInCart(index)
                    ? const Icon(Icons.ice_skating)
                    : const Text(
                        "BUY",
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
              ),
            ],
          ),
        ),
      );
}
