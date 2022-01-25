import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagramproject/controller/snackBarError.dart';

class PostController extends GetxController {
  static PostController get to => Get.find();
  late TextEditingController contents;
  late var file = <String, File>{}.obs;

  final picker = ImagePicker();

  // firebase insert
  void add(user) async {
    String downloadURL = "";
    if (user != "") {
      if (file["image"] != null) {
        downloadURL = await getImgUrl(file["image"]);
      }
      var doc = FirebaseFirestore.instance.collection('post');
      await doc.add({
        'id': doc.id,
        'photoUrl': downloadURL,
        'contents': contents.text,
        'email': user.email,
        'displayName': user.displayName,
        'userPhotoUrl': user.photoURL
      });
      Get.back();
    } else {
      snackBarError("error");
    }
  }

  // firebase image storage
  getImgUrl(image) async {
    final storageReference = FirebaseStorage.instance
        .ref()
        .child("post/${DateTime.now().millisecondsSinceEpoch}");
    if (image != null) {
      await storageReference.putFile(image!);
      return await storageReference.getDownloadURL();
    }
  }

  void getImg() async {
    var pickedFile = await picker.getImage(
        source: ImageSource.gallery, imageQuality: 50, maxWidth: 400);
    if (pickedFile != null) {
      file({
        "image": File(pickedFile.path),
      });
    }
  }

  @override
  void onInit() {
    super.onInit();
    contents = TextEditingController();
  }

  @override
  void onClose() {
    contents.dispose();
    super.onClose();
  }
}
