import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// class AuthService {
//   final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

//   Stream<User?> get onAuthStateChanged => _firebaseAuth.authStateChanges();

//   // GET UID
//   Future<String> getCurrentUID() async {
//     return _firebaseAuth.currentUser!.uid;
//   }
// }

class SignInSignUpResult {
  final User? user;
  final String? message;
  SignInSignUpResult({this.user, this.message});
}

class LoginWithPhoneNumber {}

class AuthResult {
  final User? user;
  final String? message;
  AuthResult({this.user, this.message});
}

class Auth1 {
  static FirebaseAuth _auth = FirebaseAuth.instance;
  static FirebaseFirestore _firestore = FirebaseFirestore.instance;
  static FirebaseAuth get getAuthInstance {
    return _auth;
  }

  static FirebaseFirestore get getFirestoreInstance {
    return _firestore;
  }

  static Future<bool> watchUser() async {
    bool isLoggedin = false;
    try {
      StreamSubscription<User?> s =
          await _auth.authStateChanges().listen((User? user) async {
        if (user == null) {
          print(user);
          isLoggedin = await true;
          print('User is currently signed out!');
        } else {
          isLoggedin = await false;
          print('User is signed in!');
        }
      });
      s;
      return isLoggedin;
    } catch (e) {
      print(e);
    }
    return false;
  }

  static Future<bool> cekCurrentUser() async {
    try {
      return _auth.currentUser != null;
    } catch (e) {
      print(e);
    }
    return false;
  }

  static Future<SignInSignUpResult> createUser(
      {required String email, required String pass}) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: pass);
      return SignInSignUpResult(user: result.user);
    } catch (e) {
      return SignInSignUpResult(message: e.toString());
    }
  }

  // static Future verifyPhoneNumber(String name, String email,
  //     String bankAccountNumber, String password, String phoneNumber) async {
  //   try {
  //     bool isRegistered = false;
  //     await FirebaseAuth.instance.verifyPhoneNumber(
  //       phoneNumber: phoneNumber,
  //       timeout: Duration(seconds: 60),
  //       verificationCompleted: (PhoneAuthCredential credential) {
  //         _auth.signInWithCredential(credential).then((user) async => {
  //               await _firestore
  //                   .collection("users")
  //                   .doc(_auth.currentUser!.uid)
  //                   .set(<String, dynamic>{
  //                     'name': name,
  //                     'email': email,
  //                     'bankAccountNumber': bankAccountNumber,
  //                     'password': password,
  //                     'cellnumber': phoneNumber
  //                   }, SetOptions(merge: true))
  //                   .then((value) => {isRegistered = true})
  //                   .catchError((dynamic onError) => {
  //                         debugPrint(
  //                             'Error saving user to db.' + onError.toString())
  //                       })
  //             });
  //       },
  //       verificationFailed: (FirebaseAuthException e) {},
  //       codeSent: (String verificationId, int resendToken) {
  //         verificationCode = verificationId;
  //       },
  //       codeAutoRetrievalTimeout: (String verificationId) {},
  //     );
  //   } catch (e) {}
  // }

  static Future<SignInSignUpResult> signInWithEmailAndPassword(
      {required String email, required String pass}) async {
    try {
      UserCredential result =
          await _auth.signInWithEmailAndPassword(email: email, password: pass);
      return SignInSignUpResult(user: result.user);
    } catch (e) {
      return SignInSignUpResult(message: e.toString());
    }
  }

  static void signOut() {
    _auth.signOut();
  }
}
