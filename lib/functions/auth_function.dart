import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

//bool credBool = false;

signUp(String emailAddress, String password) async {
  try {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: emailAddress,
      password: password,
    );

    debugPrint("SignUp Successful>>>>>>>>>>>>>>>>>>>>>.");
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      debugPrint('The password provided is too weak.');
    } else if (e.code == 'email-already-in-use') {
      debugPrint('The account already exists for that email.');
    }
  } catch (e) {
    throw Exception(e);
  }
}

signIn(String emailAddress, String password) async {
  try {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: emailAddress, password: password);
    debugPrint('Login successfull>>>>>>>>>>>>>');
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      debugPrint('No user found for that email.');
    } else if (e.code == 'wrong-password') {
      debugPrint('Wrong password provided for that user.');
    }
  }
}
