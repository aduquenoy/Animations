import 'package:Animation/animations/AnimatedContainer.dart';
import 'package:Animation/models/data.dart';
import 'package:Animation/models/material_design.dart';
import 'package:Animation/models/section.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {

  final List<Section> _sections = [
    Section(name: "Animated container", icon: Icons.score, destination: AnimatedContainerDemo()),
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
        itemBuilder: (context, index) => tile(context, _sections[index]),
        separatorBuilder: (context, index) => MyDivider(),
        itemCount: _sections.length,
      ),
    );
  }

  ListTile tile(BuildContext context, Section section){
    return ListTile(
      leading: Icon(section.icon),
      title: Text(section.name),
      trailing: Icon(Icons.arrow_forward_ios),
      onTap: (){Data().pusher(context, section.name, section.destination);},
    );
  }
}
