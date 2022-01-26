import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:instagramproject/controller/userController.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Instagram clon',
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
          Padding(padding: EdgeInsets.all(50)),
          SignInButton(
            Buttons.GoogleDark,
            onPressed: () {
              UserController.to.google_sign();
            },
          ),
        ],
      ),
    ));
  }
}
