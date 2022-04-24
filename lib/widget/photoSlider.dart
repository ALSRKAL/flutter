import 'package:doctor/widget/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:lottie/lottie.dart';

import '../screens/1photoSlider.dart';

class photoSlider extends StatelessWidget {
  const photoSlider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          const SizedBox(
            width: 20,
          ),
          Hero(
            tag: '1photoSlider',
            child: Material(
              elevation: 8,
              borderRadius: BorderRadius.circular(20),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Stack(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Photo1slider()));
                    },
                    child: Ink.image(
                      image: const AssetImage('images/hospital/s.jpg'),
                      fit: BoxFit.cover,
                      width: MediaQuery.of(context).size.width / 1.1,
                      height: 180,
                    ),
                  ),
                  Positioned(
                    bottom: 100,
                    child: Lottie.asset(
                      'images/discound.json',
                      width: 100,
                      height: 100,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Material(
            elevation: 8,
            borderRadius: BorderRadius.circular(20),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Stack(
              children: [
                InkWell(
                  onTap: () {},
                  child: Ink.image(
                    image: const AssetImage('images/hospital/a.jpg'),
                    fit: BoxFit.cover,
                    width: MediaQuery.of(context).size.width / 1.1,
                    height: 180,
                  ),
                ),
                Positioned(
                  bottom: 100,
                  child: Lottie.asset(
                    'images/discound.json',
                    width: 100,
                    height: 100,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Material(
            elevation: 8,
            borderRadius: BorderRadius.circular(20),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Stack(
              children: [
                InkWell(
                  onTap: () {},
                  child: Ink.image(
                    image: const AssetImage('images/hospital/y.jpg'),
                    fit: BoxFit.cover,
                    width: MediaQuery.of(context).size.width / 1.1,
                    height: 180,
                  ),
                ),
                Positioned(
                  bottom: 100,
                  child: Lottie.asset(
                    'images/discound.json',
                    width: 100,
                    height: 100,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 20,
          ),
        ],
      ),
    );
  }
}
