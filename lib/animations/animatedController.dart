import 'package:Animation/models/data.dart';
import 'package:Animation/models/material_design.dart';
import 'package:Animation/models/transition_type.dart';
import 'package:flutter/material.dart';

class AnimatedControllerDemo extends StatefulWidget {
  final TransitionType type;

  const AnimatedControllerDemo(this.type);

  @override
  _AnimatedControllerDemoState createState() => _AnimatedControllerDemoState();
}

class _AnimatedControllerDemoState extends State<AnimatedControllerDemo>
    with SingleTickerProviderStateMixin {
  Image _image = Image.asset(Data().flutter);
  AnimationController _animationController;
  Duration _duration = Duration(seconds: 1);
  DecorationTween _decorationTween;
  Animation<Decoration> _animationDecoration;
  CurvedAnimation _curvedAnimation;
  bool isAnime = false;
  double max;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: _duration);
    _curvedAnimation =
        CurvedAnimation(parent: _animationController, curve: Curves.linear);
    setupDecoration();
  }

  setupDecoration() {
    BoxDecoration begin = BoxDecoration(
        color: Colors.lightBlue, borderRadius: BorderRadius.circular(15));
    BoxDecoration end = BoxDecoration(
        color: Colors.orange, borderRadius: BorderRadius.circular(150));
    _decorationTween = DecorationTween(begin: begin, end: end);
    _animationDecoration = _decorationTween.animate(_curvedAnimation);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    max = size.width;

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Center(
          child: Container(
            height: max,
            width: max * 0.8,
            child: Center(
              child: transition(),
            ),
          ),
        ),
        FlatButton(
          onPressed: () {
            performTransition();
          },
          child: Text("Activer la transition"),
        ),
      ],
    );
  }

  Widget transition() {
    switch (widget.type) {
      case TransitionType.decoratedBox:
        return decoratedBox();
      case TransitionType.fade:
        return fade();
      case TransitionType.positionned:
        return positioned();
      case TransitionType.rotation:
        return rotation();
      case TransitionType.scale:
        return scale();
      default:
        return EmptyWidget();
    }
  }

  performTransition() {
    if (isAnime) {
      _animationController.reverse();
    } else {
      _animationController.forward();
    }
    isAnime = !isAnime;
  }

  // Transition Widgets
  DecoratedBoxTransition decoratedBox() {
    return DecoratedBoxTransition(
      decoration: _animationDecoration,
      child: _image,
    );
  }

  FadeTransition fade() {
    return FadeTransition(
      opacity: Tween<double>(
        begin: 1,
        end: 0,
      ).animate(
        CurvedAnimation(
          parent: _animationController,
          curve: Curves.easeOut,
        ),
      ),
      child: _image,
    );
  }

  Widget positioned() {
    return Stack(
      children: <Widget>[
        PositionedTransition(
          rect: RelativeRectTween(
            begin: RelativeRect.fromLTRB(0, 0, 0, 0),
            end: RelativeRect.fromLTRB(max, max, max, max),
          ).animate(_curvedAnimation),
          child: Container(color: Colors.blueAccent),
        ),
        PositionedTransition(
          rect: RelativeRectTween(
            begin: RelativeRect.fromLTRB(0, 0, 0, 0),
            end: RelativeRect.fromLTRB(200, 250, 0, 0),
          ).animate(_curvedAnimation),
          child: _image,
        ),
      ],
    );
  }

  RotationTransition rotation() {
    Tween<double> tween = Tween<double>(begin:0, end: 0.75);
    return RotationTransition(
      turns: tween.animate(_curvedAnimation),
      child: _image,
    );
  }

  ScaleTransition scale() {
    Tween<double> tween = Tween<double>(begin:0, end: 0.8);
    return ScaleTransition(
      scale: tween.animate(_curvedAnimation),
      child: _image,
    );
  }
}
