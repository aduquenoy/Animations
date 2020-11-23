import 'package:Animation/models/data.dart';
import 'package:Animation/models/section.dart';
import 'package:flutter/material.dart';

class Tile extends StatelessWidget {
  
  final Section section;
  Tile(this.section);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(section.icon),
      title: Text(section.name),
      trailing: Icon(Icons.arrow_forward_ios),
      onTap: (){Data().pusher(context, section.name, section.destination);},
    );
  }
}