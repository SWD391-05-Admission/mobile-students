import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInProvider extends ChangeNotifier {
  final googleSignIn = GoogleSignIn();
  GoogleSignInAccount _user;
  GoogleSignInAccount get getUser => _user;

  Future googleLogin() async {
    final googleUser = await googleSignIn.signIn();
    if (googleUser == null) {
      log('google user null'.toUpperCase());
      return;
    }
    _user = googleUser;
    final googleAuth = await googleUser.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    await FirebaseAuth.instance.signInWithCredential(credential);
    log('google user not null'.toUpperCase());
    notifyListeners();
  }

  Future googleLogout() async {
    await googleSignIn.disconnect();
    FirebaseAuth.instance.signOut();
    notifyListeners();
  }
}
