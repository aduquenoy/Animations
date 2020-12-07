import 'package:flutter/material.dart';

class AnimatedPhysicalModelDemo extends StatefulWidget {
  @override
  _AnimatedPhysicalModelDemoState createState() =>
      _AnimatedPhysicalModelDemoState();
}

class _AnimatedPhysicalModelDemoState extends State<AnimatedPhysicalModelDemo> {

  bool anim = false;

  @override
  Widget build(BuildContext context) {

    final double max = MediaQuery.of(context).size.width;

    return Center(
      child: InkWell(
        onTap: (){
          setState(() {
            anim = !anim;
          });
        },
        child: AnimatedPhysicalModel(
          child: Container(
            height: max * 0.5,
            width: max * 0.5,
          ),
          shape: BoxShape.rectangle,
          elevation: (anim) ? 8 : 0,
          color: (anim) ? Colors.blueAccent : Colors.lightGreen,
          shadowColor: (anim) ? Colors.grey : Colors.white,
          duration: Duration(seconds: 2),
        ),
      ),
    );
  }
}
