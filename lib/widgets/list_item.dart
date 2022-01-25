import 'package:flutter/material.dart';

class ListItem extends StatelessWidget {
  final String name;
  final int quantity;
  final int price;
  final String description;

  final int id;
  final int listId;

  const ListItem(
      {Key? key,
      required this.id,
      required this.name,
      required this.quantity,
      required this.price,
      required this.description,
      required this.listId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.all(5),
      child: Row(
        children: [
          Image.asset('assets/images/list_item_placeholder.jpeg'),
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
