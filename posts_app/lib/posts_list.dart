//clase para enlistar post por respuesta http
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:postsapp/com_list.dart';
import 'package:postsapp/comments.dart';
import 'package:postsapp/postdex.dart';
import 'package:http/http.dart' as http;
import 'package:postsapp/v_globales.dart' as globals;


class PostsList extends StatefulWidget {
  @override
  _PostsListState createState() => _PostsListState();
}
//metodo que guarda en una variable tipo string la direccion del json post  y creacion de una variable de tipo post para seleccionar un post
class _PostsListState extends State<PostsList> {
  String url = "https://raw.githubusercontent.com/KarenMelendezTec/app_post/master/post.json";
  Postdex postdex;

  @override

  //metodo util para hacer la peticion del api antes de que se ejecute el build
  //para que los datos esten antes de que entre al build
  void initState() {
    super.initState();
    fetchData();
  }
 //metodo que espera por medio de await la peticion http, para hacer la peticion http y guarda la peticion en la variable response
  void fetchData() async{//datos future
    var response = await http.get(url);
    //parseo del json, por medio del jsondecode manda los datos a una variable var
    var decodedJson = jsonDecode(response.body);
    //con la respuesta llenamos la clase postdex
    postdex = Postdex.fromJson(decodedJson);
    setState(() {

    });
  }
 //metodo donde se construye la aplicacion
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.white,

      appBar: PreferredSize(
          preferredSize: Size.fromHeight(60.0),
        child:
      AppBar(
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.forum,size: 40,color: Colors.white)
          )
        ],
        elevation: 6.0,
        title: Container(child: Text("Postings", style:
        TextStyle(fontWeight: FontWeight.bold, fontSize: 30,color: Colors.white)
          ,)/*,padding: const EdgeInsets.all(90.0)*/),
        backgroundColor: Colors.redAccent[400],
      )),
      //habilitamos draw al vacio para mejor diseño de la app para proxima agregacion de menu
      drawer: Drawer(),
      //como se metio una variable de tipo asincrono se tiene que preguntar si postdex es igual a null va a responder
      //con un center que mostrara un indicador de progreso, si no con un listview  va a enlistar todos los post encontrados
      body: postdex==null ? Center(child: CircularProgressIndicator(),) :
      ListView(

        //Mapeo de una lista dependiendo de la cantidad de elementos que tenga postdex ya que como puede cambiar la lista
        //o aumentar sus elementos es necesario mapear para saber cuantos post estan
        children: postdex.post.map((p)=> Padding(
          padding: const EdgeInsets.all(2.0),
          //InkWell para navegar entre pantallas a la pantalla de comentarios
          child: InkWell(
            onTap: (){
              //variable global donde se guardara el id del post para poder encontrar los comentarios de ese post
              globals.id_post=p.id.toString();
              //navegar a la pantalla de comentarios, clase Com_list
              Navigator.push(context, MaterialPageRoute(builder: (context) => Com_list(post: p,)));
            },
            child: Hero(
              tag: p.title,
              child: Container(
                height: 170,
                //Elemento card para el post y dependiendo los post son los cards que se generaran
                child: Card(
                  color: Colors.grey[600],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  elevation: 5.0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.all(30.0),
                        height: 150,
                        child: ListTile(
                            title: new Text(
                              //p.title para traer el titulo del post obtenido del mapeo
                              p.title,
                              textAlign: TextAlign.start,
                              style: TextStyle( fontSize: 17,color: Colors.white, fontStyle: FontStyle.normal),
                            ),
                          //iconos de las card de usuario y email
                          leading: Icon(Icons.account_box,size: 70, color: Colors.white,),
                          trailing:  Icon(Icons.email, size: 40,color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          //to list para que se genere un array de solo objetos cards
        )).toList(),
      ),


    );
  }
}





