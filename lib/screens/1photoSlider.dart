import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Photo1slider extends StatelessWidget {
  const Photo1slider({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Hero(tag: '1photoSlider', child: Image.asset('images/hospital/s.jpg')),),
      
    );
  }
}