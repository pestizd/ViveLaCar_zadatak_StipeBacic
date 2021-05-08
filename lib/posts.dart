import 'package:flutter/material.dart';
import 'package:flutter_http_vive/Details.dart';
import 'package:flutter_http_vive/http_service.dart';
import 'package:flutter_http_vive/post_model.dart';

class PostsPage extends StatelessWidget {
  final HttpService httpService = HttpService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Posts"),
        ),
        body: FutureBuilder(
          future: httpService.getPosts(),
          builder: (BuildContext context, AsyncSnapshot<List<Post>> snapshot) {
            if (snapshot.hasData) {
              List<Post> posts = snapshot.data;

              return ListView(
                children: posts
                    .map(
                      (Post post) => ListTile(
                          title: Text(post.title),
                          subtitle: Text(
                            post.id.toString(),
                          ),
                          //Event koji ce se desiti kada pretisnemo taj dio posta
                          onTap: () =>
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Details(
                                  post: post,
                                ),
                              )) //Ruta za drugu stranicu
                          ),
                    )
                    .toList(),
              );
            }
            //Default loading krug
            return Center(child: CircularProgressIndicator());
          },
        ));
  }
}
