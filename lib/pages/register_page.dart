// ignore_for_file: file_names, prefer_const_literals_to_create_immutables, prefer_const_constructors, use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_page/components/My_Button.dart';
import 'package:flutter_login_page/components/My_Textfield.dart';
import 'package:flutter_login_page/components/Tuile_Carre.dart';
import 'package:flutter_login_page/pages/services/auth_service.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onTap;
  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  //text editing controller
  final emailController = TextEditingController();

  final passwordController = TextEditingController();
  final confirmpasswordController = TextEditingController();

  //signup
  void signUserUp() async {
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
      //check if password confirm
      if (passwordController.text == confirmpasswordController.text) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );
        // Show success pop-up
        Fluttertoast.showToast(
          msg: "User created successfully!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0,
        );
      }
    } catch (e) {
      // Handle any errors during user creation
      print("Error creating user: $e");
    }
  }

  //     } else {
  //       //show error message
  //       ShowErrorMessage("password on't match");
  //     }
  //     Navigator.pop(context);
  //   } on FirebaseAuthException catch (e) {
  //     Navigator.pop(context);
  //     // ShowErrorCode(e.message!);
  //     print(e.message);
  //     //if wrong user EMAIL

  //     ShowErrorMessage(e.code);
  //   }
  // }

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

                Text("Let\'s  create an account for you !",
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

                SizedBox(height: 10),
                //password textfield
                MyTextField(
                  controller: confirmpasswordController,
                  hintText: 'confirm password',
                  obscuredText: true,
                ),
                SizedBox(height: 25),
                SizedBox(height: 10),
                //sign in buttom
                MyButton(
                  text: "Sign Up",
                  onTap: signUserUp,
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
                    Text('Already have an account  !',
                        style: TextStyle(color: Colors.grey.shade700)),
                    SizedBox(width: 4),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: Text('Login now !',
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
