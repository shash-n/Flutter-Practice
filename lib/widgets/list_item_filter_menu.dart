import 'package:flutter/material.dart';

class ListItemFilterMenu extends StatefulWidget {
  const ListItemFilterMenu({Key? key}) : super(key: key);

  @override
  State<ListItemFilterMenu> createState() => _ListItemFilterMenuState();
}

class _ListItemFilterMenuState extends State<ListItemFilterMenu> {
  double _costRangeSliderValue = 0;
  double _distanceRangeSliderValue = 0;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Filter & Sorting",
                    style: TextStyle(
                        color: Theme.of(context).primaryColorDark,
                        fontSize: 20)),
                Divider(
                  color: Theme.of(context).primaryColorDark,
                  thickness: 2,
                ),
              ],
            ),
            Column(
              children: [
                Container(
                  width: double.infinity,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColorLight,
                      borderRadius: BorderRadius.circular(5)),
                  child: Text(
                    "Sort By",
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Wrap(
                    direction: Axis.vertical,
                    spacing: 5,
                    crossAxisAlignment: WrapCrossAlignment.start,
                    children: [
                      Text(
                        "Min to Max",
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                      Text(
                        "Cost High to Low",
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                      Text(
                        "Cost Low to High",
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Column(
              children: [
                Container(
                  width: double.infinity,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColorLight,
                      borderRadius: BorderRadius.circular(5)),
                  child: Text(
                    "Filter By",
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Offers",
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          OfferCheckbox(),
                          OfferCheckbox(),
                          OfferCheckbox(),
                          OfferCheckbox(),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Column(
              children: [
                Container(
                  width: double.infinity,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColorLight,
                      borderRadius: BorderRadius.circular(5)),
                  child: Text(
                    "Cost Range",
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
                Slider(
                  onChanged: (double value) {
                    setState(() {
                      _costRangeSliderValue = value;
                    });
                  },
                  value: _costRangeSliderValue,
                  label: "hi",
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Column(
              children: [
                Container(
                  width: double.infinity,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColorLight,
                      borderRadius: BorderRadius.circular(5)),
                  child: Text(
                    "Distance Range",
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
                Slider(
                  onChanged: (double value) {
                    setState(() {
                      _distanceRangeSliderValue = value;
                    });
                  },
                  value: _distanceRangeSliderValue,
                  label: "hi",
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Column(
              children: [
                Container(
                  width: double.infinity,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColorLight,
                      borderRadius: BorderRadius.circular(5)),
                  child: Text(
                    "Rating",
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RatingButton(),
                    RatingButton(),
                    RatingButton(),
                    RatingButton(),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}

class RatingButton extends StatelessWidget {
  const RatingButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          TextButton(
              onPressed: () {},
              child: Row(
                children: [
                  Icon(Icons.star),
                  Text("1.0"),
                ],
              )),
        ],
      ),
    );
  }
}

class OfferCheckbox extends StatefulWidget {
  const OfferCheckbox({Key? key}) : super(key: key);

  @override
  _OfferCheckboxState createState() => _OfferCheckboxState();
}

class _OfferCheckboxState extends State<OfferCheckbox> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 10,
          height: 10,
          child: Checkbox(
            onChanged: (status) {},
            value: true,
          ),
        ),
        SizedBox(
          width: 7,
        ),
        Text(
          "10% off",
          style: TextStyle(
            color: Colors.black,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
