import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:httpexample/models/product.dart';

class Products extends StatefulWidget {
  const Products({Key? key}) : super(key: key);

  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  List<Product> productList = [];

  @override
  void initState() {
    super.initState();
    getProducts();
  }

  void getProducts() async {
    Uri url = Uri.https("dummyjson.com", "products");

    final response = await http.get(url);
    final data = json.decode(response.body);
    final products = data["products"];
    List<Product> productFromWebAPI =
        []; //oluşturduğumuz productsları listede tutarız.
    for (final item in products) {
      //Productlardaki her bir itemı gez
      Product product = Product(
          id: item["id"],
          title: item["title"],
          description: item["description"],
          price: item["price"]); //her item için yeni product oluştur
      productFromWebAPI.add(
          product); //Her bir ürün için oluşturulan Product nesnesi, productFromWebAPI adlı bir liste içine eklenir. Böylece, bu liste, JSON verisindeki tüm ürünleri içerir.
    }

    setState(() {
      productList =
          productFromWebAPI; //for döngüsü bittiğinde, productList'e bu productları veririz
    });
  }

//productList değişkeni, widget'ın durumunu temsil eden bir değişken. setState fonksiyonu, Flutter'a widget'ın durumunun değiştiğini bildirir ve bu durumu günceller. Bu durum güncellemesi, productList'in içeriğini productFromWebAPI listesi ile değiştirerek gerçekleşir.
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView.builder(
        itemCount: productList.length,
        itemBuilder: (ctx, index) {
          return Text(productList[index].title);
        },
      ),
    );
  }
}
