import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

String url =
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTxUZnoEVU0zmvXUlmKucX_8I7sY6CFc5vfFdtfoesL19CBcs0QHWrpDLt-C4jVJ4eQ3MU&usqp=CAU";

SliverAppBar sliverAppBar(BuildContext context) {
  return SliverAppBar(
    centerTitle: true,
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
    backgroundColor: Colors.cyan,
    // leading: (Icon(Icons.menu)),
    expandedHeight: MediaQuery.of(context).size.height * 0.35,
    pinned: true,
    stretch: true,
    flexibleSpace: FlexibleSpaceBar(
      stretchModes: [StretchMode.zoomBackground],
      background: Image.network(url, fit: BoxFit.cover),
    ),
  );
}
