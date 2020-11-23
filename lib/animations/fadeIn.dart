import 'package:Animation/models/data.dart';
import 'package:flutter/material.dart';

class FadeInDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: FadeInImage(
        placeholder: AssetImage(Data().flutter),
        image: NetworkImage("https://journalmetro.com/wp-content/uploads/2014/07/vacances_hawaii_oahu_c100.jpg"),
      fadeInCurve: Curves.linear,
      //fadeOutCurve: Curves.linear,
      fadeInDuration: Duration(seconds: 1),
      //fadeOutDuration: Duration(seconds: 1),
      ),
    );
  }
}