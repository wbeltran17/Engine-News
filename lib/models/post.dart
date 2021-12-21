class Post {
    late final String autor;
    late final String texto;
    late final DateTime fecha;
  
   Post(this.autor,this.texto, this.fecha);

  Post.fromJson(Map<dynamic,dynamic>json)
  :fecha=DateTime.parse(json['fecha'] as String),
  texto = json['texto'] as String,
  autor = json['autor'] as String;

  Map<dynamic, dynamic>toJson()=><dynamic,dynamic>{
    'fecha':fecha.toString(),
    'texto':texto,
    'autor':texto,
  };
}