import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_coffee_and_tea/services/auth_service.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final username = FirebaseAuth.instance.currentUser;

  void signOut() async {
    FirebaseAuth.instance.signOut();
    await AuthService().signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffA77F60),
      appBar: AppBar(
        backgroundColor: Color(0xffA77F60),
        actions: [
          IconButton(
            onPressed: signOut, 
            icon: Icon(Icons.logout)
          )
        ],
        
      ),
      body: SafeArea(
        
        child: Center(
          child: Text('Welcome back, ${username!.email}'),
        ),
      ),
    );
  }
}