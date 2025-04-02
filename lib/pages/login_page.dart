import 'package:ecommerce_app/components/my_button.dart';
import 'package:ecommerce_app/pages/top_page.dart';
import 'package:ecommerce_app/services/auth/auth_service.dart';
import 'package:ecommerce_app/services/user_firestore_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    UserFirestoreService().addUser();
    super.dispose();
  }

  Future<void> _signIn(BuildContext context) async {
    final authService = Provider.of<AuthService>(context, listen: false);
    try {
      final userCredential = await authService.signInWithEmailAndPassword(
        _emailController.text.trim(),
        _passwordController.text.trim(),
      );
      final userInfo = await authService.getUserInfo(userCredential.user!.uid);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => TopPage()),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('ログインに失敗しました: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("LOGIN",
                style: TextStyle(
                    color: Theme.of(context).colorScheme.primary, fontSize: 32)),

            const SizedBox(height: 5,),

            Text(
                "Welcome back, you've been missed!",
                style: TextStyle(
                    color: Theme.of(context).colorScheme.secondary)),

            const SizedBox(height: 25,),

            TextField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'Email', border: OutlineInputBorder()),
            ),
            const SizedBox(height: 10,),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(labelText: 'Password', border: OutlineInputBorder()),
            ),
            const SizedBox(height: 20),
            MyButton(
                onTap: () => _signIn(context),
                child: const Text('Login')),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Not a member?'),
                const SizedBox(width: 5,),
                GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/register_page');
                    },
                    child: const Text("Register now", style: TextStyle(fontWeight: FontWeight.bold),)),
              ],
            ),
            const SizedBox(height: 20),

            // Googleサインインボタン
            MyButton(
                onTap: () => AuthService().signInWithGoogle(),
                child: const Text('Google Sign In')),
            const SizedBox(height: 20,),
            MyButton(
                onTap: () => Navigator.pushNamed(context, "/shop_page"),
                child: const Text('Try Demo')),
          ],
        ),
      ),
    );
  }
}
