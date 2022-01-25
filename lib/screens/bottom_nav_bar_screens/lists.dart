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
  final List<UList> listModelObjects = [];

  ListDatabaseHelper listDbHelper = ListDatabaseHelper();

  TextEditingController listNameController = TextEditingController();

  _ListsState() {
    initialFetch();
  }

  void initialFetch() async {
    final listList = await listDbHelper.queryAllLists();
    for (int i = 0; i < listList.length; i++) {
      UList listModelObject = UList(
          id: 0,
          name: "--DUMMY--",
          type: "--DUMMY--",
          totalItems: 0,
          totalAmount: 0);
      setState(() {
        listModelObjects.add(listModelObject);
      });
      listModelObject.fromMap(listList[i]);
      calculateListFields(listList[i]['id']);
    }
  }

  void addList() async {
    UList listModelObject = UList(
        id: 0,
        name: listNameController.text,
        type: "type",
        totalItems: 0,
        totalAmount: 0);
    int listId = await listDbHelper.insertList(listModelObject);
    listModelObject.id = listId;
    setState(() {
      listModelObjects.add(listModelObject);
    });
    calculateListFields(listId);
    listNameController.text = "";
    FocusManager.instance.primaryFocus?.unfocus();
  }

  void calculateListFields(listId) async {
    List itemList = await listDbHelper.queryAllItems();
    // print(listModelObjects);
    for (int i = 0; i < itemList.length; i++) {
      if (itemList[i]['listId'] == listId) {
        final listModelObject = listModelObjects
            .firstWhere((listModelObject) => listModelObject.id == listId);
        int quantity = itemList[i]['quantity'];
        int price = itemList[i]['price'];
        setState(() {
          listModelObject.totalAmount += price * quantity;
          listModelObject.totalItems += quantity;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView.builder(
          itemCount: listModelObjects.length,
          itemBuilder: (BuildContext context, int index) {
            return ListElement(
              listId: listModelObjects[index].id,
              name: listModelObjects[index].name,
              type: listModelObjects[index].type,
              totalItems: listModelObjects[index].totalItems,
              totalAmount: listModelObjects[index].totalAmount,
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: addList,
        label: Row(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.75,
              child: TextField(
                decoration: null,
                controller: listNameController,
                onEditingComplete: addList,
              ),
            ),
            const Icon(Icons.add)
          ],
        ),
      ),
    );
  }
}
