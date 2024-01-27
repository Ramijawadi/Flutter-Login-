// ignore_for_file: file_names, prefer_const_literals_to_create_immutables, prefer_const_constructors, use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_page/components/My_Button.dart';
import 'package:flutter_login_page/components/My_Textfield.dart';
import 'package:flutter_login_page/components/Tuile_Carre.dart';
import 'package:flutter_login_page/pages/services/auth_service.dart';

class LoginPage extends StatefulWidget {
  final Function()? onTap;
  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //text editing controller
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  //signin
  void signUserIn() async {
//add loader to the page

    showDialog(
      context: context,
      builder: (contex) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      // ShowErrorCode(e.message!);
      print(e.message);
      //if wrong user EMAIL

      ShowErrorMessage(e.code);
    }
  }

  void ShowErrorMessage(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Color.fromARGB(255, 218, 123, 142),
          title: Center(
            child: Text(
              message,
              style: TextStyle(color: Colors.white),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 225, 221, 221),
        body: SingleChildScrollView(
          reverse: true,
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 50),
                //logo
                Icon(Icons.lock, size: 20),

                SizedBox(height: 25),

                Text("you are welcome you\'ve been missed !",
                    style:
                        TextStyle(color: Colors.grey.shade700, fontSize: 16)),

                SizedBox(height: 25),
                //you are welcome
                //email testfield

                MyTextField(
                  controller: emailController,
                  hintText: 'email',
                  obscuredText: false,
                ),

                SizedBox(height: 10),
                //password textfield
                MyTextField(
                  controller: passwordController,
                  hintText: 'password',
                  obscuredText: true,
                ),
                // SizedBox(height: 10),

                //forget password
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 20.0),
                        child: Text(
                          'forget password !',
                          style: TextStyle(color: Colors.grey.shade800),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 25),
                //sign in buttom
                MyButton(
                  text: "Sign In",
                  onTap: signUserIn,
                ),

                SizedBox(height: 25),
                //or continue with
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey.shade400,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(" or continue with ",
                            style: TextStyle(color: Colors.grey.shade700)),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey.shade400,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TuileCarre(
                        onTap: () => AuthService().signInWithGoogle(),
                        imagePath: 'lib/images/google1.png'),
                    SizedBox(width: 30),
                    TuileCarre(
                        onTap: () {}, imagePath: 'lib/images/apple1.png'),
                  ],
                ),

                SizedBox(height: 10),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Not member !',
                        style: TextStyle(color: Colors.grey.shade700)),
                    SizedBox(width: 4),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: Text('Register now !',
                          style: TextStyle(
                              color: Colors.blue, fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
                //google and apple sign in button

                //not a member , register now
              ],
            ),
          ),
        ));
  }
}
