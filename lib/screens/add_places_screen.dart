import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/place.dart';
import '../providers/great_places.dart';
import '../widgets/image_input.dart';
import '../widgets/location_input.dart';

class AddPlacesScreen extends StatefulWidget {
  static const routeName = '/add-places';
  const AddPlacesScreen({super.key});

  @override
  State<AddPlacesScreen> createState() => _AddPlacesScreenState();
}

class _AddPlacesScreenState extends State<AddPlacesScreen> {
  final _titleController = TextEditingController();
  late File? _pickedImage;
  late Placelocation? _placelocation;
  void _selectImage(File pickedImage) {
    _pickedImage = pickedImage;
  }

  void _selectPlace(double latitude, double longitude) {
    _placelocation = Placelocation(
      latitude: latitude,
      longitude: longitude,
    );
  }

  void _savePlace() {
    if (_titleController.text.isEmpty ||
        _pickedImage == null ||
        _placelocation == null) {
      return;
    }

    Provider.of<GreatPlaces>(context, listen: false).addPlace(
      _titleController.text,
      _pickedImage!,
      _placelocation!,
    );

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add a new place'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: SingleChildScrollView(
                child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(hintText: 'Title'),
                    controller: _titleController,
                  ),
                  const SizedBox(height: 10),
                  ImageInput(onSelectImage: _selectImage),
                  const SizedBox(height: 10),
                  LocationInput(onSelectPlace: _selectPlace),
                  Container(
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text('Select Location'),
                    ),
                  ),
                ],
              ),
            )),
          ),
          ElevatedButton(
            onPressed: () {
              _savePlace();
            },
            child: const Text('+ Add place'),
            style: TextButton.styleFrom(
              padding: const EdgeInsets.symmetric(
                horizontal: 30.0,
                vertical: 4,
              ),
              elevation: 0,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              backgroundColor: Theme.of(context).colorScheme.secondary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
