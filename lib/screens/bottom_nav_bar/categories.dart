import 'package:flutter/material.dart';

class Categories extends StatefulWidget {
  const Categories({Key? key}) : super(key: key);

  final String title = "Categories";

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  List<String> dropdownSublist = ['Kotlin', 'Java', 'Flutter'];
  List<String> dropdownItems = ['Android', 'IOS', 'QA', 'web', 'BA'];
  String? dropdownValue = '';

  bool isSwitched = false;

  void onDropdownChanged(String? value) {
    setState(() {
      dropdownValue = value;
    });
  }

  _CategoriesState() {
    dropdownValue = dropdownItems[0];
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          DropdownButton<String>(
            value: dropdownValue,
            style: TextStyle(color: Theme.of(context).primaryColor),
            borderRadius: BorderRadius.circular(5.0),
            items: dropdownItems.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: onDropdownChanged,
          ),
          Switch(
            activeColor: Theme.of(context).primaryColorDark,
            activeTrackColor: Theme.of(context).primaryColorLight,
            onChanged: (status) {
              setState(() {
                isSwitched = !isSwitched;
              });
            },
            value: isSwitched,
          ),
          const LinearProgressIndicator(
            value: 0.6, //controller.value,
            semanticsLabel: 'Linear progress indicator',
          ),
        ],
      ),
    );
  }
}
