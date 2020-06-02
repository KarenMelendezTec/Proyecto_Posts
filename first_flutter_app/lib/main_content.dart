import 'package:flutter/material.dart';

class MainContent extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("First App"),
      ),
      body: Container(
        height: 200,
        width: 400,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.purple,width:2.0)
        ),
        padding: EdgeInsets.only(top: 10.0, left: 16.0, right: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text("Hola",style: TextStyle(fontSize: 30.0,color: Colors.green)),
            Text("Que", style: TextStyle(fontSize: 40.0,color: Colors.greenAccent)),
            Text("Hace",style: TextStyle(fontSize: 50.0,color: Colors.pink))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: Icon(Icons.add),
      ),
      backgroundColor: Colors.lightGreenAccent,
    );
  }
}