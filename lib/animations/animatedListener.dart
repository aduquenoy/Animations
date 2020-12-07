import 'package:Animation/models/data.dart';
import 'package:flutter/material.dart';

class AnimatedListenerDemo extends StatefulWidget {
  @override
  _AnimatedListenerDemoState createState() => _AnimatedListenerDemoState();
}

class _AnimatedListenerDemoState extends State<AnimatedListenerDemo>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Duration _duration = Duration(seconds: 2);
  Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: _duration,
    );

    _animation = Tween<double>(
      begin: -0.2,
      end: 0.2,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.linear,
      ),
    )..addListener(() {
      print(_animationController.value);

      if(_animationController.isCompleted){
        _animationController.reverse();
      }else if(_animationController.isDismissed){
        _animationController.forward();
      }
    });

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RotationTransition(
        turns: _animation,
        child: Image.asset(Data().flutter),
      ),
    );
  }
}
