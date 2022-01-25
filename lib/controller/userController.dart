import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class UserController extends GetxController {
  static UserController get to => Get.find();
  RxList user = [].obs;

  setUser(userData) {
    user.add(userData);
  }

  getUser() {
    return user;
  }
}
