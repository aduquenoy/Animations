import 'package:flutter/material.dart';

class AnimatedContainerDemo extends StatefulWidget {
  @override
  _AnimatedContainerDemoState createState() => _AnimatedContainerDemoState();
}

class _AnimatedContainerDemoState extends State<AnimatedContainerDemo> {
  Duration _duration = Duration(seconds: 2);
  double min = 0;
  double max = 300;
  double heightValue = 150;
  double widthValue = 150;
  Color _color = Colors.blue;

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
                offset: Offset(3, 0),
                spreadRadius: 2.5,
                blurRadius: 3,
              )
            ],
            borderRadius: BorderRadius.circular(10),
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
