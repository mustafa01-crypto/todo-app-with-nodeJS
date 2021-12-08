import 'package:flutter/material.dart';

class NumberTextForm extends StatelessWidget {
  const NumberTextForm({
    Key? key,
    required this.number,
  }) : super(key: key);

  final TextEditingController number;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: number,
        keyboardType: TextInputType.number,
        decoration: numberDecoration(),
        validator: (val) {
          if (val == null || val.isEmpty) {
            return 'Number can not be null';
          }
          return null;
        },
      ),
    );
  }
}

InputDecoration numberDecoration() {
  return InputDecoration(
    hintText: "Number",
    enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
    focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
    disabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
  );
}
