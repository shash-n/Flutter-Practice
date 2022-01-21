import 'package:flutter/material.dart';

import '../../widgets/list_element.dart';

class Lists extends StatefulWidget {
  const Lists({Key? key}) : super(key: key);

  final String title = "";

  @override
  State<Lists> createState() => _ListsState();
}

class _ListsState extends State<Lists> {
  final listItemValues = <Map>[
    {
      'cardTitle': "Home",
      'cardDescription': "Private",
      'cardTotals': 780,
      'cardAmount': 2000
    },
    {
      'cardTitle': "Home",
      'cardDescription': "Private",
      'cardTotals': 780,
      'cardAmount': 2000
    },
    {
      'cardTitle': "Home",
      'cardDescription': "Private",
      'cardTotals': 780,
      'cardAmount': 2000
    },
    {
      'cardTitle': "Home",
      'cardDescription': "Private",
      'cardTotals': 780,
      'cardAmount': 2000
    },
    {
      'cardTitle': "Home",
      'cardDescription': "Private",
      'cardTotals': 780,
      'cardAmount': 2000
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView.builder(
        itemCount: 5,
        itemBuilder: (BuildContext context, int index) {
          return ListItem(
            cardTitle: listItemValues[index]['cardTitle'],
            cardDescription: listItemValues[index]['cardDescription'],
            cardTotals: listItemValues[index]['cardTotals'],
            cardAmount: listItemValues[index]['cardAmount'],
          );
        },
      ),
    );
  }
}
