

  import 'package:flutter/material.dart';

void snackbar({required context,required text}){
  
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: Colors.red,
      
      
      content: Text(text,style: TextStyle(fontWeight: FontWeight.bold),)));
  }