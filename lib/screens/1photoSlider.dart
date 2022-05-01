import 'package:doctor/dataJson/ListOfJson.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Photo1slider extends StatelessWidget {
   Photo1slider({ Key? key, var i }) : super(key: key);

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Hero(tag: 'g', child: Image.asset('images/hospital/s.jpg')),),
      
    );
  }
}