import 'dart:ui';

import 'package:doctor/widget/colors.dart';
import 'package:flutter/material.dart';

class heartDisease extends StatelessWidget {
  const heartDisease({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: kprimryColors,
            boxShadow: const [
              BoxShadow(blurRadius: 5, spreadRadius: 0.5, color: Colors.black26)
            ]),
        width: width - 40,
        height: 300,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListView(
              children: [
                Container(
                  color: Colors.amber,
                  width: 20,
                  height: 20,
                  
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
