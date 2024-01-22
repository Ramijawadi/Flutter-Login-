// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_page/pages/Login_Page.dart';
import 'package:flutter_login_page/pages/home_page.dart';
import 'package:flutter_login_page/pages/login_or_register_page.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          //user loged in
          if (snapshot.hasData) {
            return HomePage();
          } else {
            return LoginOrRegister();
          }

          //user not logget in
        },
      ),
    );
  }
}
