import 'package:flutter/material.dart';

class AddButtonText extends StatelessWidget {
  const AddButtonText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      "Ekle",
      style: TextStyle(
        color: Colors.white,
      ),
    );
  }
}
