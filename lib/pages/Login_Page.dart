// ignore_for_file: file_names, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_login_page/components/My_Button.dart';
import 'package:flutter_login_page/components/My_Textfield.dart';
import 'package:flutter_login_page/components/Tuile_Carre.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  //text editing controller

  final usenameController = TextEditingController();
  final passwordController = TextEditingController();

  //signin

  void SignUserIn() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade200,
        body: SafeArea(
        
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 50),
                //logo
                Icon(Icons.lock, size: 60),

                SizedBox(height: 50),

                Text("you are welcole you\'ve been missed !",
                    style:
                        TextStyle(color: Colors.grey.shade700, fontSize: 16)),

                SizedBox(height: 25),
                //you are welcome
                //username testfield

                MyTextField(
                  controller: usenameController,
                  hintText: 'username',
                  obscuredText: false,
                ),

                SizedBox(height: 10),
                //password textfield
                MyTextField(
                  controller: passwordController,
                  hintText: 'password',
                  obscuredText: true,
                ),

                //forget password
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('forget password !',
                          style: TextStyle(color: Colors.grey.shade800)),
                    ],
                  ),
                ),

                SizedBox(height: 25),
                //sign in buttom
                MyButton(
                  onTap: SignUserIn,
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
                SizedBox(height: 40),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TuileCarre(imagePath: 'lib/images/google1.png'),
                    SizedBox(width: 30),
                    TuileCarre(imagePath: 'lib/images/apple1.png'),
                  ],
                ),

                SizedBox(height: 50),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Not member !' , style:TextStyle(color:Colors.grey.shade700)),
                    SizedBox(width: 4),
                    Text('Register now !' , style:TextStyle(color:Colors.blue , fontWeight: FontWeight.bold)),
                  ],
                ),
                //google and apple sign in button

                //not a member , register now
              ],
            ),
          
        ));
  }
}
