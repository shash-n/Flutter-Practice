import 'package:flutter/material.dart';

import '../widgets/list_element_filter_menu.dart';
import '../widgets/list_element_settings_menu.dart';

import '../widgets/list_item.dart';

import '../../utils/list_db_helper.dart';

import '../../models/lists_model.dart';

class ListItemDetails extends StatefulWidget {
  final String title;
  final String description;

  final int listId;

  const ListItemDetails(
      {Key? key,
      required this.listId,
      required this.title,
      required this.description})
      : super(key: key);

  @override
  State<ListItemDetails> createState() => _ListItemDetailsState();
}

class _ListItemDetailsState extends State<ListItemDetails> {
  final List<Item> itemModelObjects = [];

  ListDatabaseHelper listDbHelper = ListDatabaseHelper();

  _ListItemDetailsState() {
    initialFetch();
  }

  void initialFetch() async {
    List itemList = await listDbHelper.queryAllItems();

    for (int i = 0; i < itemList.length; i++) {
      if (itemList[i]['listId'] == widget.listId) {
        final Item listModelObject = Item(
            id: -1,
            name: "name",
            quantity: -1,
            price: -1,
            description: "description",
            listId: -1);
        listModelObject.fromMap(itemList[i]);
        setState(() {
          itemModelObjects.add(listModelObject);
        });
      }
    }
  }

  void addItem() async {
    // String name, int quantity, int price, String description) async {
    Item itemModelObject = Item(
        id: -1,
        name: "name",
        quantity: 1,
        price: 33,
        description: "description",
        listId: widget.listId);
    int itemId = await listDbHelper.insertItem(itemModelObject);
    itemModelObject.id = itemId;
    setState(() {
      itemModelObjects.add(itemModelObject);
    });
  }

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
            widget.title,
            style: Theme.of(context).textTheme.headline2,
          ),
          Text(
            widget.description,
            style: Theme.of(context).textTheme.bodyText2,
          ),
        ]),
      ),
      body: Column(
        children: [
          SizedBox(
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
                                width:
                                    MediaQuery.of(context).size.width * 0.01),
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
          Expanded(
            child: ListView.builder(
              itemCount: itemModelObjects.length,
              itemBuilder: (BuildContext context, int index) {
                return ListItem(
                  id: itemModelObjects[index].id,
                  name: itemModelObjects[index].name,
                  quantity: itemModelObjects[index].quantity,
                  price: itemModelObjects[index].price,
                  description: itemModelObjects[index].description,
                  listId: itemModelObjects[index].listId,
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: addItem,
        label: Row(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.75,
              child: TextField(
                decoration: null,
                // controller: listNameController,
                onEditingComplete: addItem,
              ),
            ),
            const Icon(Icons.add)
          ],
        ),
      ),
    );
  }
}
