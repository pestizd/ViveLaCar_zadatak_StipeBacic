import 'dart:convert';

import 'package:flutter_http_vive/post_model.dart';
import 'package:http/http.dart';

class HttpService {
  //final String postsUrl = "https://jsonplaceholder.typicode.com/posts";
  var postsUrl = Uri.http("https://jsonplaceholder.typicode.com", "/posts");
  //Api postavljamo/dohvacamo

  //Funkcija za brisanje
  Future<void> deletePost(int id) async {
    //Parsiramo post pomocu $
    Response res = await delete(Uri.parse("$postsUrl/$id"));
    //Trebalo bi postaviti try catch da radi u offline modeu

    if (res.statusCode == 200) {
      print("Erased!"); //Ako je izbrisano vraca nam poruku
    }
  }

  Future<List<Post>> getPosts() async {
    Response res = await get(postsUrl);
    //Ako je request dobar vrati mi body
    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      //Zelimo uzeti body i dobiti postove u nasem app

      List<Post> posts =
          body.map((dynamic item) => Post.fromJson(item)).toList();
      //Vraca listu postova
      return posts;
    } else {
      throw "Not able to get posts."; //Ako nam ne moze vratiti postove
    }
  }
}
