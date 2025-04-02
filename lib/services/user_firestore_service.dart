import 'package:cloud_firestore/cloud_firestore.dart';

class UserFirestoreService {
  static FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> addUser() async {
    try {
      await firestore.collection('users').add({
        'name': 'Funny',
        'job': 'Stylist',
        'area': 'New York',
      });
    } catch (e) {
      print("Account Creation Error : $e");
    }
  }
}