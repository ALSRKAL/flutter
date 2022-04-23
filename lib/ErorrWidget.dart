import 'package:flutter/material.dart';

customErrorScreen(){
  return ErrorWidget.builder=((details) {
    return Material(
      child: Container(
        color:Colors.black,
        child: Column(
          children: [
            Image.asset('images/erorr.png'),
            Padding(padding: const EdgeInsets.all(8.0),
            child: Text(
              details.exception.toString(),
              style: const TextStyle(color: Colors.white,fontSize:18),
              textAlign: TextAlign.center,
              
            ),)
          ],
        ), 
    ),
    );
  });
}