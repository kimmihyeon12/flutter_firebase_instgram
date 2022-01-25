import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:instagramproject/controller/userController.dart';
import 'package:instagramproject/page/tap_page.dart';

import 'login_page.dart';

class RootPage extends StatelessWidget {
  const RootPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(), // firebase값이 바뀌면?
      builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
        if (!snapshot.hasData) {
          return LoginPage();
        } else {
          UserController.to.setUser(snapshot.data);
          return TapPage(snapshot.data);
        }
      },
    );
  }
}
