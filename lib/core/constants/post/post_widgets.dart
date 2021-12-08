import 'package:flutter/material.dart';

Padding postNameForm(TextEditingController name, String nameHint) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: TextFormField(
      //initialValue: widget.name,
      controller: name,
      decoration: InputDecoration(
        hintText: nameHint,
        enabledBorder:
            OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        focusedBorder:
            OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        disabledBorder:
            OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
      validator: (val) {
        if (val == null || val.isEmpty) {
          return 'Name can not be null';
        }
        return null;
      },
    ),
  );
}

Padding postSurnameForm(TextEditingController surname, String surnameHint) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: TextFormField(
      controller: surname,
      decoration: InputDecoration(
        hintText: surnameHint,
        enabledBorder:
            OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        focusedBorder:
            OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        disabledBorder:
            OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
      validator: (val) {
        if (val == null || val.isEmpty) {
          return 'Surname can not be null';
        }
        return null;
      },
    ),
  );
}

Padding numberFormPadding(TextEditingController number, String numberHint) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: TextFormField(
      controller: number,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        hintText: numberHint,
        enabledBorder:
            OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        focusedBorder:
            OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        disabledBorder:
            OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
      validator: (val) {
        if (val == null || val.isEmpty) {
          return 'Number can not be null';
        }
        return null;
      },
    ),
  );
}
