import 'package:get/get.dart';

void snackBarError(String msg) {
  Get.snackbar(
    "ERROR",
    msg,
    duration: Duration(seconds: 2),
  );
}
