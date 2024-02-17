import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:miniblog/models/blog.dart';
import 'package:miniblog/screens/add_blog.dart';
import 'package:miniblog/widgets/blog_item.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<Blog> blogs = [];
  //blogs isimli bir liste tanımlanmış ve initState metodu içinde fetchBlogs metodu çağrılarak sayfanın başlatılma aşamasında blogları getirme işlemi başlatılmıştır.
  @override
  void initState() {
    super.initState();
    fetchBlogs();
  }
  //fetchBlogs metodu, verileri bir API'den çekmek için kullanılır. http.get ile belirtilen URL'den bir GET isteği yapılır, ardından gelen JSON verisi json.decode ile çözümlenir. Daha sonra, bu JSON verileri map ve toList kullanılarak Blog sınıfına dönüştürülüp blogs listesine atanır. setState çağrısı ile arayüz güncellenir.

  fetchBlogs() async {
    Uri url = Uri.parse("https://tobetoapi.halitkalayci.com/api/Articles");
    final response = await http.get(url);
    final List jsonData = json.decode(response.body);

    setState(() {
      blogs = jsonData.map((json) => Blog.fromJson(json)).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: const Text("Bloglar"),
        actions: [
          IconButton(
              onPressed: () async {
               bool? result= await Navigator.of(context)
                    .push(MaterialPageRoute(builder: (ctx) => AddBlog()));
                    if(result == true){
                      fetchBlogs();
                    }
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: blogs.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : RefreshIndicator(
              onRefresh: () async {
                fetchBlogs();
              },
              child: ListView.builder(
                itemBuilder: (context, index) => BlogItem(
                  blog: blogs[index],
                ),
                itemCount: blogs.length,
              ),
            ),
    );
  }
}
