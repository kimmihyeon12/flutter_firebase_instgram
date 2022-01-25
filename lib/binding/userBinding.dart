import 'package:get/get.dart';
import 'package:instagramproject/controller/userController.dart';

class UserBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(UserController());
  }
}
