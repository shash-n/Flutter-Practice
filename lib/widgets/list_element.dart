import 'package:flutter/material.dart';

import '../screens/list_element_details_screen.dart';

class ListItem extends StatelessWidget {
  final String cardTitle;
  final String cardDescription;
  final int cardTotals;
  final int cardAmount;

  const ListItem(
      {Key? key,
      required this.cardTitle,
      required this.cardDescription,
      required this.cardTotals,
      required this.cardAmount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ListItemDetails(
                    title: cardTitle,
                    description: cardDescription,
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
                        Text(cardTitle),
                        Text(cardDescription),
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
                    Text("Totals: ${cardTotals.toString()}"),
                    Text("\$" + cardAmount.toString()),
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
