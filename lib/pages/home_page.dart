import 'package:Animation/animations/AnimatedContainer.dart';
import 'package:Animation/animations/animatedBuilder.dart';
import 'package:Animation/animations/animatedList.dart';
import 'package:Animation/animations/animatedListener.dart';
import 'package:Animation/animations/animatedPhysicalModel.dart';
import 'package:Animation/animations/graph.dart';
import 'package:Animation/models/data.dart';
import 'package:Animation/models/material_design.dart';
import 'package:Animation/models/section.dart';
import 'package:Animation/pages/other_animated_list.dart';
import 'package:Animation/pages/transition_list.dart';
import 'package:Animation/widgets/tile.dart';
import 'package:flutter/material.dart';

import 'hero_list.dart';

class HomePage extends StatelessWidget {

  final List<Section> _sections = [
    Section(name: "Animated container", icon: Icons.score, destination: AnimatedContainerDemo()),
    Section(name: "Animated list", icon: Icons.list, destination: AnimatedListDemo()),
    Section(name: "Animated builder", icon: Icons.build, destination: AnimatedBuilderDemo()),
    Section(name: "Animated physical model", icon: Icons.menu, destination: AnimatedPhysicalModelDemo()),
    Section(name: "Animated listener", icon: Icons.hearing, destination: AnimatedListenerDemo()),
    Section(name: "Animated other", icon: Icons.local_movies, destination: OtherAnimatedList()),
    Section(name: "Transition", icon: Icons.compare_arrows, destination: TransitionList()),
    Section(name: "Hero", icon: Icons.flash_on, destination: HeroList()),
    Section(name: "Graphique", icon: Icons.show_chart, destination: Graph()),
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