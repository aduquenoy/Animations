import 'package:Animation/animations/animatedController.dart';
import 'package:Animation/models/material_design.dart';
import 'package:Animation/models/section.dart';
import 'package:Animation/models/transition_type.dart';
import 'package:Animation/widgets/tile.dart';
import 'package:flutter/material.dart';

class TransitionList extends StatelessWidget {

  final List<Section> _sections = [
    Section(name: "Decorated box", icon: Icons.compare_arrows, destination: AnimatedControllerDemo(TransitionType.decoratedBox)),
    Section(name: "Fade", icon: Icons.compare_arrows, destination: AnimatedControllerDemo(TransitionType.fade)),
    Section(name: "Positionned", icon: Icons.compare_arrows, destination: AnimatedControllerDemo(TransitionType.positionned)),
    Section(name: "Rotation", icon: Icons.compare_arrows, destination: AnimatedControllerDemo(TransitionType.rotation)),
    Section(name: "Scale", icon: Icons.compare_arrows, destination: AnimatedControllerDemo(TransitionType.scale)),
    Section(name: "Size", icon: Icons.compare_arrows, destination: AnimatedControllerDemo(TransitionType.size)),
    Section(name: "Slide", icon: Icons.compare_arrows, destination: AnimatedControllerDemo(TransitionType.slide)),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (BuildContext context, int index) => Tile(_sections[index]),
      itemCount: _sections.length,
      separatorBuilder: (BuildContext context, int index) => MyDivider(),
    );
  }
}