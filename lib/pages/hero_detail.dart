import 'package:flutter/material.dart';
import 'package:Animation/animations/hero.dart';
import 'package:Animation/models/greek_city.dart';

class HeroDetail extends StatelessWidget {
  final HeroWidget hero;
  final GreekCity city;

  const HeroDetail(
    this.city,
    this.hero,
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        hero,
        Text(city.description),
      ],
    );
  }
}
