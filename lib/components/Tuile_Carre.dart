// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';

class TuileCarre extends StatelessWidget {

  final String imagePath; 
  const TuileCarre({super.key   , required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.all(20),
   decoration: BoxDecoration(border: Border.all(color:Colors.white), 
   borderRadius: BorderRadius.circular(10), 
   color: Colors.grey.shade300),
      child: Image.asset(imagePath , height: 40,
      
       
      ),
       );
  }
}