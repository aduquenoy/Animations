import 'package:Animation/models/data.dart';
import 'package:flutter/material.dart';
import 'package:vector_math/vector_math.dart' show radians;
import 'dart:math' as math;

class AnimatedMenu extends StatefulWidget {
  @override
  _AnimatedMenuState createState() => _AnimatedMenuState();
}

class _AnimatedMenuState extends State<AnimatedMenu> with SingleTickerProviderStateMixin {

  AnimationController _animationController;
  Duration _duration = Duration(seconds: 1);
  Animation<double> _scale;
  Animation<double> _move;
  Animation<double> _rotation;
  CurvedAnimation _curvedAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this, duration: _duration);
    _curvedAnimation = CurvedAnimation(parent: _animationController, curve: Curves.bounceOut);
    
    _scale = Tween<double>(begin:1, end: 0).animate(_curvedAnimation);
    _move = Tween<double>(begin:0, end: 75).animate(_curvedAnimation);
    _rotation = Tween<double>(begin:0, end: math.pi*2).animate(_curvedAnimation);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {    
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, builder) {
        return Transform.rotate(
          angle: _rotation.value,
          child: stack(),
        );
      },
    );
  }

  Stack stack() {
    return Stack(
      alignment: Alignment.center,
      children: [
        menuChoice(Icons.hearing, Colors.blue, "0", menuSelected, 0, 0),
        menuChoice(Icons.hearing, Colors.blue, "1", menuSelected, 90, 0),
        menuChoice(Icons.hearing, Colors.blue, "2", menuSelected, 180, 0),
        menuChoice(Icons.hearing, Colors.blue, "3", menuSelected, 270, 0),
        Transform.scale(scale: _scale.value - 1, child: fab(Icons.close, Colors.red, "Close", closeMenu, 0),),
        Transform.scale(scale: _scale.value, child: fab(Icons.menu, Colors.blue, "Open", openMenu, 5),),        
      ],
    );
  }

  FloatingActionButton fab(IconData icon, Color color, String tag, VoidCallback onPressed, double hauteur) {
    return FloatingActionButton(
      onPressed: onPressed,
      child: Icon(icon),
      backgroundColor: color,
      heroTag: tag,
      elevation: hauteur,
    );
  }

  menuChoice(IconData icon, Color color, String tag, VoidCallback onPressed, double angle, double hauteur){
    double radian = radians(angle);
    double x = (_move.value) * math.cos(radian);
    double y = (_move.value) * math.sin(radian);

    return Transform(
      transform: Matrix4.identity()..translate(x, y),
      child: fab(icon, color, tag, onPressed, hauteur),
    );
  }

  openMenu(){
    _animationController.forward();
  }

  closeMenu(){
    _animationController.reverse();
  }

  menuSelected(){
    closeMenu();
    Data().pusher(context, "New page", Center(child: Text("Blabla")));
  }
}
