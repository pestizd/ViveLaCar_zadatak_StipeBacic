import 'package:flutter/foundation.dart';

class Post {
  //Post ima 4 polja
  final int userId;
  final int id;
  final String title;
  final String body;
  //Parametri moraju biti obavezni
  Post(
      {@required this.userId,
      @required this.id,
      @required this.title,
      @required this.body});

  //Trebamo dobiti odgovor od Jsona i parsirati
  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
        userId: json['userId'] as int,
        id: json['id'] as int,
        title: json['title'] as String,
        body: json['body'] as String);
  }
}
