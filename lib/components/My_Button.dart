// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {

  final Function()? onTap ;
  const MyButton({super.key , required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(

      onTap:onTap ,
      child: Container(
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(color:Colors.black , 
        borderRadius: BorderRadius.circular(10)),
        
      
        child : Center(
      child: Text("sign in" , 
      style:TextStyle(color:Colors.white ,fontWeight: FontWeight.bold , 
      fontSize: 18),
      
      
      ),
        ),
      
      ),
    );
  }
}