import 'package:flutter/material.dart';

import '../widgets/list_item_filter_menu.dart';
import '../widgets/list_item_settings_menu.dart';

class ListItemDetails extends StatelessWidget {
  final String title;
  final String description;

  const ListItemDetails(
      {Key? key, required this.title, required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: Theme.of(context).iconTheme,
        titleSpacing: 0,
        elevation: 0,
        backgroundColor: Theme.of(context).secondaryHeaderColor,
        title: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            title,
            style: Theme.of(context).textTheme.headline2,
          ),
          Text(
            description,
            style: Theme.of(context).textTheme.bodyText2,
          ),
        ]),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height * 0.062,
        child: Card(
          margin: EdgeInsets.zero,
          elevation: 2,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 10),
                    child: Row(
                      children: [
                        Icon(
                          Icons.location_on_rounded,
                          color: Theme.of(context).primaryColor,
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.01),
                        const Text("John - TW12 44GH - London"),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (context) =>
                                    const ListItemFilterMenu());
                          },
                          icon: Icon(
                            Icons.filter_list_rounded,
                            color: Theme.of(context).primaryColorDark,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (context) =>
                                    const ListItemSettingsMenu());
                          },
                          icon: Icon(
                            Icons.settings,
                            color: Theme.of(context).primaryColorDark,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
