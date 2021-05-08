import 'package:flutter/material.dart';
import 'package:flutter_http_vive/http_service.dart';
import 'package:flutter_http_vive/post_model.dart';

class Details extends StatelessWidget {
  final Post post;
  final HttpService httpService = HttpService();
  Details({
    @required this.post,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //Postavljamo naslov kao ime posta
        title: Text(post.title),
      ),
      //Stvaramo iconu za brisanje postova
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.delete),
        onPressed: () async {
          //Trebat ce nam varijabla httpservice
          await httpService.deletePost(post.id);
          Navigator.of(context).pop();
        },
      ),
      //Dodajemo body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Card(
            child: Column(
              children: <Widget>[
                //Poredak informacija na kartici (body)
                ListTile(
                  title: Text("Title"),
                  subtitle: Text(post.title),
                ),
                ListTile(
                  title: Text("ID"),
                  subtitle: Text("${post.title}"),
                ),
                ListTile(
                  title: Text("Body"),
                  subtitle: Text(post.body),
                ),
                ListTile(
                  title: Text("User ID"),
                  subtitle: Text("${post.userId}"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
