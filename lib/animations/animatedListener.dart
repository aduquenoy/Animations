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
  bool opacity = false;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: _duration,
    );

    _animation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.linear,
      ),
    )..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              //_animationController.reverse();
              //Data().pusher(context, "After animation", Center(child: Text("Nouvelle page"),));
              setState(() {
                opacity = !opacity;
              });
            } else if (status == AnimationStatus.dismissed) {
              _animationController.forward();
            }
          })
        /* ..addListener(() {
      print(_animationController.value);

      if(_animationController.isCompleted){
        _animationController.reverse();
      }else if(_animationController.isDismissed){
        _animationController.forward();
      }
    }) */
        ;

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
        child: AnimatedOpacity(
          opacity: (opacity) ? 0 : 1,
          duration: Duration(seconds: 1),
          child: Image.asset(Data().flutter),
        ),
      ),
    );
  }
}
