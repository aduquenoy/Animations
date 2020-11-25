import 'package:Animation/animations/hero.dart';
import 'package:Animation/models/data.dart';
import 'package:Animation/models/greek_city.dart';
import 'package:Animation/pages/hero_detail.dart';
import 'package:flutter/material.dart';

class HeroList extends StatelessWidget {
  final List<GreekCity> _cities = Data().cities;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        GreekCity city = _cities[index];
        HeroWidget hero = HeroWidget(city.image);

        return InkWell(
          onTap: () {
            Data().pusher(context, city.name, HeroDetail(city, hero));
          },
          child: Container(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Card(
                child: Row(
                  children: <Widget>[
                    Container(
                      height: 75,
                      width: 125,
                      child: hero,
                      margin: EdgeInsets.all(10),
                    ),
                    Text(city.name),
                  ],
                ),
              ),
            ),
          ),
        );
      },
      itemCount: _cities.length,
    );
  }
}
