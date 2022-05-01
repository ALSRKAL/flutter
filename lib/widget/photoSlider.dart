import 'package:doctor/widget/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:lottie/lottie.dart';

import '../dataJson/ListOfJson.dart';
import '../screens/1photoSlider.dart';

class photoSlider extends StatelessWidget {
  photoSlider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 150,
      child: ListView.builder(
        itemCount: photoSliderList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, i) => Row(
          children: [
            const SizedBox(
              width: 20,
            ),
            Hero(
              tag: "${photoSliderList[i]['name']}",
              child: Material(
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
                                builder: (context) => Photo1slider()));
                      },
                      child: Ink.image(
                        image: AssetImage("${photoSliderList[i]['photo']}"),
                        fit: BoxFit.cover,
                        width: MediaQuery.of(context).size.width / 1.1,
                        height: 180,
                      ),
                    ),
                    Positioned(
                        right: 20,
                        width: 30,
                        height: 30,
                        child: Image.asset(
                          "${photoSliderList[i]['lottie']}",
                        ))
                  ],
                ),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            const SizedBox(
              width: 20,
            ),
          ],
        ),
      ),
    );
  }
}
