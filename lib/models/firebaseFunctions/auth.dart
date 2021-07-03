import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';

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
