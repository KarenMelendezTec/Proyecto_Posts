import 'package:flutter/material.dart';
import 'package:postsapp/posts_list.dart';
//clase main para iniciar la app "post app"
void main(){
  runApp(MaterialApp(
    title: "Post App",
    home: PostsList(),
    debugShowCheckedModeBanner: false,
  ));
}