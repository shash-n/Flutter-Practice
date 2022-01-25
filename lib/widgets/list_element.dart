import 'package:flutter/material.dart';

import '../screens/list_element_details_screen.dart';

class ListElement extends StatelessWidget {
  final String name;
  final String type;
  final int totalItems;
  final int totalAmount;

  final int listId;

  const ListElement(
      {Key? key,
      required this.listId,
      required this.name,
      required this.type,
      required this.totalItems,
      required this.totalAmount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ListItemDetails(
                    title: name,
                    description: type,
                    listId: listId,
                  )),
        );
      },
      child: Card(
        margin: const EdgeInsets.all(10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 10,
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.13,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(name),
                        Text(type),
                      ],
                    ),
                    const Image(
                        image: AssetImage(
                            "assets/images/company_logo_placeholder.jpeg")),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(10),
                      bottomRight: Radius.circular(10)),
                  color: Theme.of(context).primaryColorLight,
                ),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Totals: ${totalItems.toString()}"),
                    Text("\$" + totalAmount.toString()),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
