import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CreatePage extends StatefulWidget {
  var user;
  CreatePage(this.user);
  @override
  _CreatePageState createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  final _textEditingController = TextEditingController();
  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  File? _image;
  final picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    print(_image);
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: _getImage,
          child: Icon(Icons.add_a_photo),
          backgroundColor: Colors.black,
        ),
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () async {
                //SET FIREBASE STORGE
                final storageReference = FirebaseStorage.instance
                    .ref()
                    .child("post/${DateTime.now().millisecondsSinceEpoch}");
                if (_image != null) {
                  var storageUploadTask =
                      await storageReference.putFile(_image!);
                  String downloadURL = await storageReference.getDownloadURL();
                  //GET FIREBASE DB(SET)
                  var doc = FirebaseFirestore.instance.collection('post');
                  doc.add({
                    'id': doc.id,
                    'photoUrl': downloadURL.toString(),
                    'contents': _textEditingController.text,
                    'email': widget.user.email,
                    'displayName': widget.user.displayName,
                    'userPhotoUrl': widget.user.photoURL
                  }).then((value) => {Navigator.pop(context)});
                }
              },
              //파일 사이즈 조절
              icon: Icon(Icons.send),
              color: Colors.black,
            )
          ],
          backgroundColor: Colors.white,
        ),
        body: _buildBody());
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: Column(
        children: [
          if (_image == null) const Text("NO IMG") else Image.file(_image!),
          TextField(
            controller: _textEditingController,
            decoration: InputDecoration(hintText: '내용을 입력하세요'),
          ),
        ],
      ),
    );
  }

  Future _getImage() async {
    var pickedFile = await picker.getImage(
        source: ImageSource.gallery, imageQuality: 50, maxWidth: 400);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }
}
