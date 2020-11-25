import 'package:Animation/animations/animatedCrossFade.dart';
import 'package:Animation/animations/animatedOpacity.dart';
import 'package:Animation/animations/animatedPosition.dart';
import 'package:Animation/animations/animatedSize.dart';
import 'package:Animation/animations/animatedText.dart';
import 'package:Animation/animations/fadeIn.dart';
import 'package:Animation/models/material_design.dart';
import 'package:Animation/models/section.dart';
import 'package:Animation/widgets/tile.dart';
import 'package:flutter/material.dart';

class OtherAnimatedList extends StatelessWidget {
  
  final List<Section> _sections = [
    Section(name: "Fade In", icon: Icons.menu, destination: FadeInDemo()),
    Section(name: "Opacity", icon: Icons.menu, destination: AnimatedOpacityDemo()),
    Section(name: "Cross Fade", icon: Icons.menu, destination: AnimatedCrossFadeDemo()),
    Section(name: "Textstyle", icon: Icons.menu, destination: AnimatedTextStyleDemo()),
    Section(name: "Size", icon: Icons.menu, destination: AnimatedSizeDemo()),
    Section(name: "Positionnement", icon: Icons.menu, destination: AnimatedPositionDemo()),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, i) => Tile(_sections[i]),
      separatorBuilder: (context, i) => MyDivider(),
      itemCount: _sections.length,
    );
  }
}
