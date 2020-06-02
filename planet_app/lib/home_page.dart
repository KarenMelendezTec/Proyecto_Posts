import 'package:flutter/material.dart';
import 'package:planet_app/gradient_app_bar.dart';
import 'package:planet_app/planet_card.dart';
import 'package:planet_app/planet_list.dart';

class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          GradientAppBar(),
          PlanetList()
        ],
      ),
    );
  }


}