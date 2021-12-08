import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

AppBar animatedAppBar() {
  return AppBar(
    backgroundColor: Colors.cyan,
    title: DefaultTextStyle(
      style: const TextStyle(
        fontSize: 30.0,
        fontFamily: 'Agne',
      ),
      child: AnimatedTextKit(
        animatedTexts: [
          TypewriterAnimatedText('Designed'),
          TypewriterAnimatedText('by'),
          TypewriterAnimatedText('Mustafa Yıldız'),
        ],
      ),
    ),
    centerTitle: true,
  );
}

SlidableAction deleteButtonAction(
    void Function(BuildContext context) deleteList) {
  return SlidableAction(
    onPressed: deleteList,
    backgroundColor: const Color(0xFFFE4A49),
    foregroundColor: Colors.white,
    icon: Icons.delete,
    label: 'Delete',
  );
}

SlidableAction updateActionButton(
    void Function(BuildContext context) updateList) {
  return SlidableAction(
    onPressed: updateList,
    backgroundColor: const Color(0xFF21B7CA),
    foregroundColor: Colors.white,
    icon: Icons.settings,
    label: 'Update',
  );
}

ButtonStyle textButtonStyle() {
  return ButtonStyle(
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30.0),
    )),
    backgroundColor: MaterialStateProperty.all(Colors.cyan),
  );
}

Icon starIcon() {
  return const Icon(
    Icons.note_add,
    color: Colors.cyan,
    size: 50,
  );
}
