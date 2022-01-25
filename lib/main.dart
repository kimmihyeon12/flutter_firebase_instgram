import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagramproject/binding/userBinding.dart';
import 'package:instagramproject/page/root_page.dart';
import 'package:instagramproject/routers/app_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: const RootPage(),
      getPages: AppPages.pages,
      initialBinding: UserBinding(),
    );
  }
}
