// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {

  final controller ;
  final String hintText ;
  final bool obscuredText ;


  const MyTextField({super.key , required this.controller , required this.hintText ,required this.obscuredText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:   const EdgeInsets.symmetric(horizontal: 25.0),
      child:  TextField(
      controller: controller,
      obscureText: obscuredText,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade400),
          ),
          fillColor: Colors.grey.shade100,
          filled: true,
          hintText: hintText,
          hintStyle:TextStyle(color: Colors.grey.shade500) ,
        ),
      ),
    );
  }
}
