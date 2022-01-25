import 'package:get/get.dart';
import 'package:instagramproject/controller/postController.dart';
import 'package:instagramproject/controller/userController.dart';

class PostBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(PostController());
  }
}
