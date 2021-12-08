import 'package:flutter/material.dart';
import 'package:todo_app/core/constants/home/home_constant_shelf.dart';

class NameTextForm extends StatelessWidget {
  const NameTextForm({
    Key? key,
    required this.name,
  }) : super(key: key);

  final TextEditingController name;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: name,
        decoration: nameDecorations('Name'),
        validator: (val) {
          if (val == null || val.isEmpty) {
            return 'Name can not be null';
          }
          return null;
        },
      ),
    );
  }
}
