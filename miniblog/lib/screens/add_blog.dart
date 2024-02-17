import 'dart:io';

import 'package:flutter/material.dart';
import "package:http/http.dart" as http;
import 'package:image_picker/image_picker.dart';

class AddBlog extends StatefulWidget {
  const AddBlog({Key? key}) : super(key: key);

  @override
  _AddBlogState createState() => _AddBlogState();
}

class _AddBlogState extends State<AddBlog> {
  final _formKey = GlobalKey<FormState>();
  final ImagePicker _picker = ImagePicker();
  XFile? selectedImage;

  String title = "";
  String content = '';
  String author = '';

  openImagePicker() async {
    XFile? selectedFile = await _picker.pickImage(source: ImageSource.gallery);

    setState(() {
      selectedImage = selectedFile;
    });
  }

  submitForm() async {
    Uri url = Uri.parse("https://tobetoapi.halitkalayci.com/api/Articles");
    var request = http.MultipartRequest("POST", url);

    if (selectedImage != null) {
      request.files
          .add(await http.MultipartFile.fromPath("File", selectedImage!.path));
    }

    request.fields["title"] = title;
    request.fields["content"] = content;
    request.fields["author"] = author;

    final response = await request.send();

    if (response.statusCode == 201) {
      Navigator.pop(context, true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text("Yeni Blog Ekle"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
            key: _formKey,
            child: ListView(
              children: [
                if (selectedImage != null)
                  Image.file(
                    File(selectedImage!.path),
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.fitHeight,
                  ),
                ElevatedButton(
                    onPressed: () {
                      openImagePicker();
                    },
                    child: Text("Resim Seç")),
                TextFormField(
                  decoration: InputDecoration(label: Text("Blog Başlığı")),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Lütfen Başlık Giriniz";
                    }
                    return null;
                  },
                  onSaved: (newValue) => title = newValue!,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    label: Text("Blog İçeği"),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Lütfen İçerik Giriniz";
                    }
                    return null;
                  },
                  onSaved: (newValue) => content = newValue!,
                  maxLines: 5,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    label: Text("Ad Soyad"),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Lütfen Ad Soyad Giriniz";
                    }
                    return null;
                  },
                  onSaved: (newValue) => author = newValue!,
                ),
                ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {}
                      if (selectedImage == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Lütfen bir resim seçin."),
                            duration: Duration(seconds: 2),
                          ),
                        );
                        return;
                      }
                      _formKey.currentState!.save();
                      submitForm();
                    },
                    child: Text("Gönder"))
              ],
            )),
      ),
    );
  }
}
