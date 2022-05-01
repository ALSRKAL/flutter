import 'package:doctor/widget/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:lottie/lottie.dart';

import '../dataJson/ListOfJson.dart';
import '../screens/photoSliderditals.dart';

class photoSlider extends StatelessWidget {
  photoSlider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 150,
      child: ListView.builder(
        itemCount: photoSliderList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, i) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          child: Row(
            children: [
              const SizedBox(
                width: 0,
              ),
              Hero(
                tag: "${photoSliderList[i]['name']}",
                child: Material(
                  shadowColor: Colors.black,
                  elevation: 8,
                  borderRadius: BorderRadius.circular(20),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Stack(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Photo1slider(i: i)));
                        },
                        child: Ink.image(
                          image: AssetImage("${photoSliderList[i]['photo']}"),
                          fit: BoxFit.cover,
                          width: MediaQuery.of(context).size.width / 1.1,
                          height: 180,
                        ),
                      ),
                      Positioned(
                          left: 10,
                          width: 60,
                          child: Lottie.asset(
                            "${photoSliderList[i]['lottie']}",
                          ))
                    ],
                  ),
                ),
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}
