import 'package:flutter/material.dart';
import 'package:instagramproject/login_page.dart';
import 'package:instagramproject/tap_page.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
          // print(snapshot);
          return TapPage(snapshot.data);
        }
      },
    );
  }
}
