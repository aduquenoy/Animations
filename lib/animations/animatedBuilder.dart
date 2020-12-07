import 'package:Animation/models/data.dart';
import 'package:flutter/material.dart';
//import 'dart:math' as math;

class AnimatedBuilderDemo extends StatefulWidget {
  @override
  _AnimatedBuilderDemoState createState() => _AnimatedBuilderDemoState();
}

class _AnimatedBuilderDemoState extends State<AnimatedBuilderDemo>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Image _image = Image.asset(Data().flutter);
  Animation<double> _scale;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    )..repeat();
    _scale = Tween<double>(begin: 0, end: 10).animate(CurvedAnimation(parent: _animationController, curve: Curves.linear));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: _animationController,
        child: _image,
        builder: (context, child) {
          return Transform.scale(
            scale: _scale.value,
            child: child,
          );
          /* return Transform.rotate(
            angle: _animationController.value * 2 * math.pi,
            child: child,
          ); */
        },
      ),
    );
  }
}
