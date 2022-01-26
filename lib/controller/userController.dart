import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:google_sign_in/google_sign_in.dart';

class UserController extends GetxController {
  static UserController get to => Get.find();
  RxList user = [].obs;

  setUser(userData) {
    user.add(userData);
  }

  getUser() {
    return user;
  }

  google_sign() async {
    print("signinwithgoogle");
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  google_sign_out() {
    final GoogleSignIn _googleSignIn = GoogleSignIn();
    FirebaseAuth.instance.signOut();
    _googleSignIn.signOut();
  }
}
