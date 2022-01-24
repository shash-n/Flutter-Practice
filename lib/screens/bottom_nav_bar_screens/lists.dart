import 'package:flutter/material.dart';

import '../../widgets/list_element.dart';

import '../../utils/list_db_helper.dart';

import '../../models/lists_model.dart';

class Lists extends StatefulWidget {
  const Lists({Key? key}) : super(key: key);

  final String title = "";

  @override
  State<Lists> createState() => _ListsState();
}

class _ListsState extends State<Lists> {
  final listItems = [];

  ListDatabaseHelper listDbHelper = ListDatabaseHelper();

  _ListsState() {
    // initialInsertLists();
    // initialInsertItems();
    initialFetchLists();
  }

  void initialInsertLists() async {
    for (int i = 0; i < 5; i++) {
      UList listModelObject = UList(
          name: "Home" + i.toString(),
          type: "Private" + i.toString(),
          totalItems: 780 * i,
          totalAmount: 2000 * i);
      listDbHelper.insertList(listModelObject);
    }
  }

  void initialInsertItems() async {
    for (int i = 0; i < 5; i++) {
      Item listModelObject = Item(
          name: "Home " + i.toString(),
          quantity: i,
          price: 100 * i,
          description: "Good item " + i.toString());
      listDbHelper.insertItem(listModelObject);
    }
    // print("Item count: " + (await listDbHelper.queryItemCount()).toString());
  }

  void initialFetchLists() async {
    final listList = await listDbHelper.queryAllLists();
    for (int i = 0; i < listList.length; i++) {
      UList listModelObject = UList(
          name: "--DUMMY--",
          type: "--DUMMY--",
          totalItems: -1,
          totalAmount: -1);
      listModelObject.fromMap(listList[i]);
      setState(() {
        listItems.add(listModelObject);
      });
    }
  }

  void addList() async {
    // String name, String type, int totalItems, int totalAmount) async {
    UList listModelObject =
        UList(name: "name", type: "type", totalItems: -1, totalAmount: -1);
    setState(() {
      listItems.add(listModelObject);
    });
    listDbHelper.insertList(listModelObject);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView.builder(
          itemCount: listItems.length,
          itemBuilder: (BuildContext context, int index) {
            return ListItem(
              cardTitle: listItems[index].name,
              cardDescription: listItems[index].type,
              cardTotals: listItems[index].totalItems,
              cardAmount: listItems[index].totalAmount,
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: addList,
        label: Row(
            // children: [TextField()],
            ),
        icon: Icon(Icons.add),
      ),
    );
  }
}
