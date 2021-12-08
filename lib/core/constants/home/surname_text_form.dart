import 'package:flutter/material.dart';

class SurnameTextForm extends StatelessWidget {
  const SurnameTextForm({
    Key? key,
    required this.surname,
  }) : super(key: key);

  final TextEditingController surname;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: surname,
        decoration: nameDecorations('Surname'),
        validator: (val) {
          if (val == null || val.isEmpty) {
            return 'Surname can not be null';
          }
          return null;
        },
      ),
    );
  }
}

InputDecoration nameDecorations(String hint) {
  return InputDecoration(
    hintText: hint,
    enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
    focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
    disabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
  );
}
