//Clase Com_list para enlistar los comentarios del post correspondiente
import 'dart:convert';
import 'package:postsapp/v_globales.dart' as globals;
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:postsapp/comments.dart';
import 'package:postsapp/postdex.dart';
import 'package:postsapp/v_globales.dart';
//metodo com_list que recibe una variable de tipo post

class Com_list extends StatefulWidget {
  @override
  Post post;
  Com_list({this.post});
  _Com_listState createState() => _Com_listState();
}
//Metodo que pide una peticion http a una ruta anidada
//En este caso en base al id de cada post trae sus respectivos comentarios
class _Com_listState extends State<Com_list> {
  Comments comments;
  bool loading = true;
  final String url = 'https://jsonplaceholder.typicode.com/posts/'+id_post+'/comments';
  var client = http.Client();
  List<Comments> com = List<Comments>();

//metodo util para hacer la peticion del api antes de que se ejecute el build
  //para que los datos esten antes de que entre al build
  @override
  void initState(){
    fetchData();
    super.initState();
  }

//metodo que espera por medio de await la peticion http, para hacer la peticion http y guarda la peticion en la variable response
  //Peticion asincrona
  Future<void> fetchData() async {
    http.Response response = await client.get(url);
    if(response.statusCode == 200){ // Connection Ok
      List responseJson = json.decode(response.body);
      responseJson.map((m) => com.add(new Comments.fromJson(m))).toList();
      setState(() {
        loading = false;
      });
    } else {
      throw('error');
    }
  }


//Metodo que construye la pantalla de comentarios y su diseño
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
       child:AppBar(
         actions: <Widget>[
          IconButton(
            icon: Icon(Icons.library_books,size: 40,color: Colors.white)
          )
        ],
        elevation: 6.0,
        title: Container(
            child: Text("Comentarios", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 29,color: Colors.white)
          )),
        backgroundColor: Colors.redAccent[400],),),
      body: Container(
          child: loading ?
          Container(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          ) :
          ListView.builder(
            itemCount: com.length,
            itemBuilder: (BuildContext context, int index){
              return Container(
                height: 120,
                padding: const EdgeInsets.all(5.0),
                child: Card(
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  color: Colors.grey[600],
                  //lista de comentarios segun el index del post, mostrando el nombre del usuario, email y añadiendo iconos para mejor diseño
                  child: ListTile(
                    title: Text(com[index].name,style: TextStyle(fontSize: 20,color: Colors.white),),
                    subtitle: Text(com[index].email,style: TextStyle(fontSize: 15),),
                    leading: Icon(Icons.chat, size: 40,color: Colors.white),
                    trailing:  Icon(Icons.favorite_border, size: 25,color: Colors.white),
                  ),
                ),
              );
            },
          )
      ),
    );
  }
}
