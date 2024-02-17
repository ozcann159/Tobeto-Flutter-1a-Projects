import 'package:flutter/material.dart';
import 'package:miniblog/models/blog.dart';

class BlogItem extends StatelessWidget {
  const BlogItem({Key? key, required this.blog}) : super(key: key);

  final Blog blog; //Dışardan blog aldık

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            AspectRatio(
                //imagelerin aynı boyutta olması için
                aspectRatio: 4 / 2,
                child: Container(
                  width: double.infinity,
                  color: Colors.grey,
                  child: Center(
                    child: Image.network(blog.thumbnail!),
                  ),
                )),
            ListTile(
              title: Text(blog.title!),
              subtitle: Text(blog.author!),
            )
          ],
        ),
      ),
    );
  }
}
