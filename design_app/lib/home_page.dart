import 'package:flutter/material.dart';

class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Prueba App"),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/img/hoola.jpg'),
                    fit: BoxFit.cover
                )
            ),

          ),
          Center(
            child: Container(
              height: 100,
              decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5)
              ),
            ),
          ),
          Center(
            child: Text("Practica 1", style: TextStyle(fontFamily: "Comic Sans MS", color: Colors.blue, fontSize: 30),),
          )

        ],
      ),
    );
  }
}