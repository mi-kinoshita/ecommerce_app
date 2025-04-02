import 'package:ecommerce_app/services/auth/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyAuthWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);

    return StreamBuilder<User?>(
      stream: authService.user,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          // ログイン済み
          return ElevatedButton(
            onPressed: () {
              authService.signOut();
            },
            child: Text('サインアウト'),
          );
        } else {
          // 未ログイン
          return ElevatedButton(
            onPressed: () async {
              try {
                await authService.signInWithEmailAndPassword(
                  'test@example.com',
                  'password',
                );
              } on FirebaseAuthException catch (e) {
                // エラー処理
                print(e);
              }
            },
            child: Text('サインイン'),
          );
        }
      },
    );
  }
}