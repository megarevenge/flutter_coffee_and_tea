import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_coffee_and_tea/services/auth_service.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  final username = FirebaseAuth.instance.currentUser;

  void signOut() async {
    FirebaseAuth.instance.signOut();
    await AuthService().signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile',
          style: TextStyle(color: Color(0xffF3E4C9), fontSize: 25),
        ),
        centerTitle: true,
        backgroundColor: Color(0xff8A5F41),
        actions: [
          IconButton(
            onPressed: signOut, 
            icon: Icon(Icons.logout),
            color: Colors.white,
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Text('Welcome back, ${username!.email}'),
        ),
      ),
    );
  }
}