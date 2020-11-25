import 'package:flutter/material.dart';

class HeroWidget extends StatelessWidget {
  final String url;

  const HeroWidget(
    this.url,
  );

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: url,
      child: Image.asset(
        url,
        fit: BoxFit.cover,
      ),
    );
  }
}
