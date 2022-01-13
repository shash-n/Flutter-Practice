import 'package:flutter/material.dart';

class ListItemSettingsMenu extends StatelessWidget {
  const ListItemSettingsMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: const Text("Filtering & Sorting"),
      children: [
        Divider(
          color: Theme.of(context).primaryColorLight,
          thickness: 2,
        ),
        const Card(child: Text("Search bar here")),
        ListView(
          children: [
            Card(
              child: Column(
                children: [
                  Card(
                    child: Column(
                      children: const [
                        Text("Min to Max"),
                        Text("Cost High to Low"),
                        Text("Cost Low to High"),
                      ],
                    ),
                  ),
                  Card(
                    child: Column(
                      children: const [
                        Text("Min to Max"),
                        Text("Cost High to Low"),
                        Text("Cost Low to High"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
