import 'package:Animation/models/data.dart';
import 'package:flutter/material.dart';

class AnimatedCrossFadeDemo extends StatefulWidget {
  @override
  _AnimatedCrossFadeDemoState createState() => _AnimatedCrossFadeDemoState();
}

class _AnimatedCrossFadeDemoState extends State<AnimatedCrossFadeDemo> {
  bool isCross = true;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: () {
          setState(() {
            isCross = !isCross;
          });
        },
        child: AnimatedCrossFade(
          firstChild: Image.asset(Data().flutter),
          secondChild: Text("Retour à l'image", style: TextStyle(fontSize: 30)),
          crossFadeState:
              (isCross) ? CrossFadeState.showFirst : CrossFadeState.showSecond,
          duration: Duration(seconds: 1),
          firstCurve: Curves.linear,
          secondCurve: Curves.linear,
        ),
      ),
    );
  }
}
