//metodo que enlista los 100 del json
//Metodo que ayuda ya que en lugar de ir parte por parte leyendo el atributo que nos interesa va a responder con un objeto de tipo postdex
class Postdex {
  //lista de post
  List<Post> post;

  Postdex({this.post});

  Postdex.fromJson(Map<String, dynamic> json) {
    //si el campo post no es nulo en el json enlista post
    if (json['post'] != null) {
      post = new List<Post>();
      json['post'].forEach((v) {
        post.add(new Post.fromJson(v));
      });
    }
  }
 //Ayuda a recorrer cada post de nuestro archivo json
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.post != null) {
      data['post'] = this.post.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
//consultor y clase para generar una instancia de la clase apartir del json post
class Post {
  int userId;
  int id;
  String title;
  String body;

  Post({this.userId, this.id, this.title, this.body});

  Post.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
    body = json['body'];
  }
//Ayuda a recorrer cada objeto del post de nuestro archivo json
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['id'] = this.id;
    data['title'] = this.title;
    data['body'] = this.body;
    return data;
  }
}