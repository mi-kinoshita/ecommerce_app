import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthService with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // ユーザーの状態を監視
  Stream<User?> get user {
    return _auth.authStateChanges();
  }

  Future<UserCredential> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      final UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      await _saveUserInfo(userCredential.user);
      notifyListeners();
      return userCredential;
    } on FirebaseAuthException catch (e) {
      print("signInWithEmailAndPassword Error: $e");
      rethrow;
    }
  }

  Future<UserCredential> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      final UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await _saveUserInfo(userCredential.user);
      notifyListeners();
      return userCredential;
    } on FirebaseAuthException catch (e) {
      print("createUserWithEmailAndPassword Error: $e");
      rethrow;
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
    notifyListeners();
  }

  Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();

    if (gUser == null) {
      throw Exception('Google sign in failed');
    }

    final GoogleSignInAuthentication gAuth = await gUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: gAuth.accessToken, idToken: gAuth.idToken);

    final UserCredential userCredential = await _auth.signInWithCredential(credential);
    await _saveUserInfo(userCredential.user);
    return userCredential;
  }

  Future<void> _saveUserInfo(User? user) async {
    if (user != null) {
      try {
        await _firestore.collection('users').doc(user.uid).set({
          'email': user.email,
          'uid': user.uid,
          'name': 'User Name', // Replace with actual user data
          'job': 'Job Title',
          'area': 'User Area',
        });
        print("User info saved successfully.");
      } catch (e) {
        print("Error saving user info: $e");
      }
    }
  }

  Future<Map<String, dynamic>?> getUserInfo(String uid) async {
    try {
      final DocumentSnapshot userDoc = await _firestore.collection('users').doc(uid).get();
      if (userDoc.exists) {
        return userDoc.data() as Map<String, dynamic>;
      }
    } catch (e) {
      print("Error getting user info: $e");
    }
    return null;
  }
}
