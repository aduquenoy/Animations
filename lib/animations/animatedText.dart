import 'dart:ui';

import 'package:flutter/material.dart';

class AnimatedTextStyleDemo extends StatefulWidget {
  @override
  _AnimatedTextStyleDemoState createState() => _AnimatedTextStyleDemoState();
}

class _AnimatedTextStyleDemoState extends State<AnimatedTextStyleDemo> {
  bool isFirst = true;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: () {
          setState(() {
            isFirst = !isFirst;
          });
        },
        child: AnimatedDefaultTextStyle(
          child: Text("Tap to change"),
          style: (isFirst) ? firstSyle() : secondSyle(),
          duration: Duration(seconds: 2),
        ),
      ),
    );
  }

  TextStyle firstSyle() {
    return TextStyle(
      color: Colors.orange,
      fontSize: 40,
      fontWeight: FontWeight.w100,
      fontStyle: FontStyle.italic,
    );
  }

  TextStyle secondSyle() {
    return TextStyle(
      color: Colors.teal,
      fontSize: 20,
      fontWeight: FontWeight.w700,
      fontStyle: FontStyle.normal,
    );
  }
}
