import 'package:flutter/material.dart';

import '../../utils/list_db_helper.dart';

import '../../models/lists_model.dart';

import '../list_element_details_screen.dart';

class Lists extends StatefulWidget {
  const Lists({Key? key}) : super(key: key);

  final String title = "";

  @override
  State<Lists> createState() => _ListsState();
}

class _ListsState extends State<Lists> {
  List<UList> listModelObjects = [];

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
      listModelObject.fromMap(listList[i]);
      setState(() {
        listModelObjects.add(listModelObject);
      });
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
    listNameController.text = "";
    FocusManager.instance.primaryFocus?.unfocus();
  }

  void refreshState() {
    listModelObjects = [];
    initialFetch();
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
                refreshStateFunction: refreshState);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        extendedPadding: const EdgeInsets.only(left: 20),
        onPressed: () {},
        label: Row(
          children: [
            Container(
              color: Theme.of(context).primaryColorLight,
              height: MediaQuery.of(context).size.height * 0.04,
              width: MediaQuery.of(context).size.width * 0.75,
              child: TextField(
                decoration: null,
                controller: listNameController,
                onEditingComplete: addList,
              ),
            ),
            IconButton(
              onPressed: addList,
              icon: const Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}

class ListElement extends StatelessWidget {
  final String name;
  final String type;
  final int totalItems;
  final int totalAmount;

  final int listId;

  final Function refreshStateFunction;

  const ListElement(
      {Key? key,
      required this.listId,
      required this.name,
      required this.type,
      required this.totalItems,
      required this.totalAmount,
      required this.refreshStateFunction})
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
              refreshStateFunction: refreshStateFunction,
            ),
          ),
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
