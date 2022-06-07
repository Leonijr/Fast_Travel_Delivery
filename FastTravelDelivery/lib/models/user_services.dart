import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:fasttravel/models/user_local.dart';

FirebaseAuth _auth = FirebaseAuth.instance;
FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

class UserServices extends ChangeNotifier {
  UserLocal? userLocal;
  //método construtor

  // Logar com email e senha
  Future<void> signIn(
    UserLocal userLocal, {
    Function? onSucess,
    Function? onFail,
  }) async {
    try {
      User? user = (await _auth.signInWithEmailAndPassword(
              email: userLocal.email!, password: userLocal.password!))
          .user;
      this.userLocal = userLocal;
      this.userLocal!.id = user!.uid;
      onSucess!();
    } on PlatformException catch (e) {
      onFail!(debugPrint(e.toString()));
    }
  }

//método para registrar usuário no FIREBASE
  Future<void> signUp(
    UserLocal userLocal, {
    Function? onSucess,
    Function? onFail,
  }) async {
    try {
      User? user = (await _auth.createUserWithEmailAndPassword(
              email: userLocal.email!, password: userLocal.password!))
          .user;
      this.userLocal = userLocal;
      this.userLocal!.id = user!.uid;
      onSucess!();
    } catch (e) {
      onFail!(e);
    }
    notifyListeners();
  }
}
