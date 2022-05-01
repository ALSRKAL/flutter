import 'package:doctor/dataJson/ListOfJson.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Photo1slider extends StatelessWidget {
  var i;

   Photo1slider({ Key? key, this.i }) : super(key: key);

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Hero(tag: "${photoSliderList[i]['']}", child: Image.asset('images/hospital/s.jpg')),),
      
    );
  }
}