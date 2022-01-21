import 'package:flutter/material.dart';

class ListItem extends StatelessWidget {
  final String name;
  final int quantity;
  final int price;
  final String description;

  const ListItem(
      {Key? key,
      required this.name,
      required this.quantity,
      required this.price,
      required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Image.asset('asset/images/list_item_placeholder.jpeg'),
          Column(
            children: [
              Text(name),
              Text(description),
              Text(quantity.toString()),
              Text(price.toString()),
            ],
          ),
        ],
      ),
    );
  }
}
