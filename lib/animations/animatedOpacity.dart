import 'package:Animation/models/data.dart';
import 'package:flutter/material.dart';

class AnimatedOpacityDemo extends StatefulWidget {
  @override
  _AnimatedOpacityDemoState createState() => _AnimatedOpacityDemoState();
}

class _AnimatedOpacityDemoState extends State<AnimatedOpacityDemo> {
  bool isOpacity = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: children(),
    );
  }

  List<Widget> children() {
    List<Widget> c = [];
    c.add(Text("Opacity"));
    
    c.add(AnimatedOpacity(
      opacity: (isOpacity) ? 0 : 1,
      duration: Duration(milliseconds: 500),
      child: Image.asset(Data().flutter),
    ));
    
    c.add(FlatButton(
        onPressed: () {
          setState(() {
            isOpacity = !isOpacity;
          });
        },
        child: Text((isOpacity) ? "Montrer" : "Cacher")));

    return c;
  }
}
