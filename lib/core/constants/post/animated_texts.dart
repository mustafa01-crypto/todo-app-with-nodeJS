import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class UpdateAnimatedText extends StatelessWidget {
  const UpdateAnimatedText({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return TextLiquidFill(
      waveDuration: const Duration(milliseconds: 1500),
      text: 'UPDATE',
      loadDuration: const Duration(seconds: 3),
      waveColor: Colors.cyan,
      boxBackgroundColor: Colors.white,
      textStyle: const TextStyle(
        fontSize: 80.0,
        fontWeight: FontWeight.bold,
      ),
      boxHeight: size.height * 0.2,
    );
  }
}
