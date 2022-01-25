import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:instagramproject/controller/postController.dart';

class CreatePage extends StatefulWidget {
  @override
  _CreatePageState createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  var user = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: PostController.to.getImg,
          child: Icon(Icons.add_a_photo),
          backgroundColor: Colors.black,
        ),
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () async {
                //SET FIREBASE STORGE
                PostController.to.add(user);
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
          if (PostController.to.file["image"] == null)
            const Text("NO IMG")
          else
            Image.file(PostController.to.file["image"]!),
          TextField(
            controller: PostController.to.contents,
            decoration: InputDecoration(hintText: '내용을 입력하세요'),
          ),
        ],
      ),
    );
  }
}
