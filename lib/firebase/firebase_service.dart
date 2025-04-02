// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
//
// class FirebaseService with ChangeNotifier {
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//
//   // データの取得
//   Stream<QuerySnapshot> getItems() {
//     return _firestore.collection('items').snapshots();
//   }
//
//   // データの追加
//   Future<void> addItem(Map<String, dynamic> data) {
//     return _firestore.collection('items').add(data);
//   }
//
//   // データの更新
//   Future<void> updateItem(String itemId, Map<String, dynamic> data) {
//     return _firestore.collection('items').doc(itemId).update(data);
//   }
//
//   // データの削除
//   Future<void> deleteItem(String itemId) {
//     return _firestore.collection('items').doc(itemId).delete();
//   }
// }