import 'package:flutter/material.dart';

class AnimatedContainerDemo extends StatefulWidget {
  @override
  _AnimatedContainerDemoState createState() => _AnimatedContainerDemoState();
}

class _AnimatedContainerDemoState extends State<AnimatedContainerDemo> {
  Duration _duration = Duration(seconds: 2);  
  Color _color = Colors.blue;
  bool _shadow = true;
  bool _radius = true;

  double min = 0;
  double max = 300;
  double heightValue = 150;
  double widthValue = 150;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const Padding(padding: EdgeInsets.all(15)),
        AnimatedContainer(
          height: heightValue,
          width: widthValue,
          // color: Colors.blue, => faut le mettre ds boxdecoration
          decoration: BoxDecoration(
            color: _color,
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                offset: (_shadow) ? Offset(3, 0) : Offset(0, 0),
                spreadRadius: (_shadow) ? 2.5 : 0,
                blurRadius: (_shadow) ? 3 : 0,
              )
            ],
            borderRadius: (_radius) ? BorderRadius.circular(25) : BorderRadius.circular(0),
          ),
          duration: _duration,
          curve: Curves.linear,
        ),
        const Padding(padding: EdgeInsets.all(15)),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: ListView(
              children: <Widget>[
                const Padding(padding: EdgeInsets.all(15)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    colorButton("Bleu", Colors.blue),
                    colorButton("Rouge", Colors.red),
                    colorButton("Vert", Colors.green),
                  ],
                ),
                const Padding(padding: EdgeInsets.all(15)),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("Hauteur: ${heightValue.round()}"),
                    Slider(
                      min: min,
                      max: max,
                      value: heightValue,
                      onChanged: (newValue) =>
                          setState(() => heightValue = newValue),
                    ),
                  ],
                ),
                const Padding(padding: EdgeInsets.all(15)),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("Largeur: ${widthValue.round()}"),
                    Slider(
                      min: min,
                      max: max,
                      value: widthValue,
                      onChanged: (newValue) =>
                          setState(() => widthValue = newValue),
                    ),
                  ],
                ),
                const Padding(padding: EdgeInsets.all(15)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Shadow: $_shadow"),
                    Switch(value: _shadow, onChanged: (newValue) => setState(() => _shadow = newValue)),
                  ],
                ),
                const Padding(padding: EdgeInsets.all(15)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Radius: $_radius"),
                    Switch(value: _radius, onChanged: (newValue) => setState(() => _radius = newValue)),
                  ],
                ),
                
              ],
            ),
          ),
        ),
      ],
    );
  }

  FloatingActionButton colorButton(String name, Color color) {
    return FloatingActionButton(
      backgroundColor: color,
      heroTag: name,
      onPressed: () => setState(() => _color = color),      
    );
  }
}
