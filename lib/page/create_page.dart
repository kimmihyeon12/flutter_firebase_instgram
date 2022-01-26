import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagramproject/controller/postController.dart';

class CreatePage extends StatelessWidget {
  var user = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: PostController.to.getImg,
          child: const Icon(Icons.add_a_photo),
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
              icon: const Icon(Icons.send),
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
            decoration: const InputDecoration(hintText: '내용을 입력하세요'),
          ),
        ],
      ),
    );
  }
}
