import 'package:Animation/models/material_design.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Data {
  String flutter = "images/flutter_logo.png";

  pusher(BuildContext context, String title, Widget destination) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return MyScaffold(title: title, destination: destination);
        },
      ),
    );
  }
}
