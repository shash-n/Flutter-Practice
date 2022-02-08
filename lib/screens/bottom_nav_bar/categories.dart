import 'dart:io';

import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:location/location.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cached_network_image/cached_network_image.dart';

class Categories extends StatefulWidget {
  const Categories({Key? key}) : super(key: key);

  final String title = "Categories";

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  XFile? _image;

  Future _pickImageFromCamera() async {
    XFile? image = await ImagePicker()
        .pickImage(source: ImageSource.camera, imageQuality: 50);
    setState(() {
      _image = image;
    });
  }

  Future _pickImageFromGallery() async {
    XFile? image1 = (await ImagePicker()
        .pickImage(source: ImageSource.gallery, imageQuality: 50));
    setState(() {
      _image = image1;
    });
  }

  List<String> dropdownSublist = ['Kotlin', 'Java', 'Flutter'];
  List<String> dropdownItems = ['Android', 'IOS', 'QA', 'web', 'BA'];
  String? dropdownValue = '';

  // final LatLng _initialMapLocation = const LatLng(23.1925450, 72.6131467);
  // late GoogleMapController mapController;
  // final Location _location = Location();

  bool isSwitched = false;

  void onDropdownChanged(String? value) {
    setState(() {
      dropdownValue = value;
    });
  }

  _CategoriesState() {
    dropdownValue = dropdownItems[0];
  }

  // void _onMapCreated(GoogleMapController _controller) {
  //   mapController = _controller;
  //   _location.onLocationChanged.listen((location) {
  //     mapController.animateCamera(
  //       CameraUpdate.newCameraPosition(
  //         CameraPosition(
  //             target: LatLng(location.latitude!, location.longitude!),
  //             zoom: 15),
  //       ),
  //     );
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          children: [
            DropdownButton<String>(
              value: dropdownValue,
              style: TextStyle(color: Theme.of(context).primaryColor),
              borderRadius: BorderRadius.circular(5.0),
              items:
                  dropdownItems.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: onDropdownChanged,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
              child: const LinearProgressIndicator(
                value: 0.6, //controller.value,
                semanticsLabel: 'Linear progress indicator',
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
              child: const AutocompleteBasicName(),
            ),
            // Expanded(
            //   child: GoogleMap(
            //     onMapCreated: _onMapCreated,
            //     initialCameraPosition: CameraPosition(
            //       target: _initialMapLocation,
            //     ),
            //     mapType: MapType.normal,
            //     myLocationButtonEnabled: true,
            //     myLocationEnabled: true,
            //   ),
            // ),
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
            Container(
              margin: const EdgeInsets.all(10),
              child: Column(
                children: [
                  ElevatedButton(
                      onPressed: _pickImageFromCamera,
                      child: const ListTile(
                        leading: Icon(
                          Icons.camera,
                        ),
                        title: Text('Image from camera'),
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                      onPressed: _pickImageFromGallery,
                      child: const ListTile(
                        leading: Icon(
                          Icons.roofing,
                        ),
                        title: Text('Image from gallery'),
                      )),
                ],
              ),
            ),
            _image == null
                ? CachedNetworkImage(
                    placeholder: (context, url) =>
                        const CircularProgressIndicator(),
                    imageUrl: 'https://picsum.photos/250?image=9')
                : Image.file(File(_image!.path))
          ],
        ),
      ),
    );
  }
}

class AutocompleteBasicName extends StatelessWidget {
  const AutocompleteBasicName({Key? key}) : super(key: key);
  static const List<String> _userOptions = [
    'Alice',
    'Bob',
    'Charlie',
  ];
  static String _displayStringForOption(String option) => option;
  @override
  Widget build(BuildContext context) {
    return Autocomplete<String>(
      displayStringForOption: _displayStringForOption,
      optionsBuilder: (TextEditingValue textEditingValue) {
        if (textEditingValue.text == '') {
          return const Iterable<String>.empty();
        }
        return _userOptions.where((String option) {
          return option
              .toLowerCase()
              .contains(textEditingValue.text.toLowerCase());
        });
      },
    );
  }
}
