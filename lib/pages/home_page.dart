import 'package:Animation/animations/AnimatedContainer.dart';
import 'package:Animation/models/data.dart';
import 'package:Animation/models/material_design.dart';
import 'package:Animation/models/section.dart';
import 'package:Animation/pages/other_animated_list.dart';
import 'package:Animation/widgets/tile.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {

  final List<Section> _sections = [
    Section(name: "Animated container", icon: Icons.score, destination: AnimatedContainerDemo()),
    Section(name: "Les autres Animated", icon: Icons.local_movies, destination: OtherAnimatedList())
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: Image.asset(Data().flutter),
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(50),
          ),
          margin: EdgeInsets.all(10),
        ),
        title: Text("Les animations avec flutter"),
      ),
      body: ListView.separated(
        itemBuilder: (context, index) => Tile(_sections[index]),
        separatorBuilder: (context, index) => MyDivider(),
        itemCount: _sections.length,
      ),
    );
  }
}