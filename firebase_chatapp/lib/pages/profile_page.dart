import 'dart:io';
import 'package:chatapptute/components/custom_textfield.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class ProfilePage extends StatefulWidget {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;
  File? _photo;
  final ImagePicker _picker = ImagePicker();

  Future<void> imgFromGallery() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _photo = File(pickedFile.path);
        uploadFile();
      });
    } else {
      print('Fotoğraf seçmediniz.');
    }
  }

  Future<void> imgFromCamera() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      setState(() {
        _photo = File(pickedFile.path);
        uploadFile();
      });
    } else {
      print('Fotoğraf seçmediniz');
    }
  }

  Future<void> uploadFile() async {
    if (_photo == null) return;
    final fileName = basename(_photo!.path);
    final destination = 'files/$fileName';

    try {
      final ref = firebase_storage.FirebaseStorage.instance
          .ref(destination)
          .child('file/');
      await ref.putFile(_photo!);
    } catch (e) {
      print('Error occurred: $e');
    }
  }

  Widget _buildTextField() {
    return Column(
      children: [
        CustomTextField(
          obscureText: false,
          controller: widget._firstNameController,
          hintText: 'Ad',
          ),
          SizedBox(height: 10),
          CustomTextField(
          obscureText: false,
          controller: widget._lastNameController,
          hintText: 'Soyad',
          )
      ],
    );
  }

Widget _buildButton(BuildContext context) {
  return Container(
    width: double.infinity,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor:  Color.fromARGB(255, 231, 85, 105),
      ),
      onPressed: () {
        saveDataToFirestore();
      },
      child: Text(
        'Kaydet',
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    ),
  );
}

void saveDataToFirestore() async {
  String firstName = widget._firstNameController.text;
  String lastName = widget._lastNameController.text;

  if (firstName.isNotEmpty && lastName.isNotEmpty) {
    try {
      await FirebaseFirestore.instance.collection('usersinfo').add({
        'firstName': firstName,
        'lastName': lastName,
      });
      print('Data saved to Firestore');
    } catch (e) {
      print('Error saving data to Firestore: $e');
    }
  } else {
    print('Please enter both first and last names');
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: const Text("Profilim"),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.grey,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            const SizedBox(
              height: 32,
            ),
            Center(
              child: GestureDetector(
                onTap: () {
                  _showPicker(context);
                },
                child: CircleAvatar(
                  radius: 55,
                  backgroundColor: Color.fromARGB(255, 231, 85, 105),
                  child: _photo != null
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image.file(
                            _photo!,
                            width: 100,
                            height: 100,
                            fit: BoxFit.fitHeight,
                          ),
                        )
                      : Container(
                          decoration: BoxDecoration(
                            color:  Theme.of(context).colorScheme.primary,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          width: 100,
                          height: 100,
                          child: Icon(Icons.camera_alt, color: Colors.grey[800]),
                        ),
                ),
              ),
            ),
            SizedBox(height: 20),
            _buildTextField(),
            SizedBox(height: 20),
             _buildButton(context),
          ],
        ),
      ),
    );
  }

  void _showPicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return SafeArea(
          child: Container(
            child: Wrap(
              children: <Widget>[
                ListTile(
                  leading: const Icon(Icons.photo_library),
                  title: const Text('Galeri'),
                  onTap: () {
                    imgFromGallery();
                    Navigator.of(context).pop();
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.photo_camera),
                  title: const Text('Kamera'),
                  onTap: () {
                    imgFromCamera();
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
