import 'package:doctor/widget/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class photoSlider extends StatelessWidget {
  photoSlider({Key? key}) : super(key: key);
  List photo = [
    Image.asset('images/hospital/e.jpg'),
    Image.asset('images/hospital/s.jpg'),
    Image.asset('images/hospital/y.jpg'),
    Image.asset('images/hospital/d.jpg'),
  ];

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 150.0,
        autoPlay: true,
        aspectRatio: 16 / 9,
        viewportFraction: 0.8,
        initialPage: 0,
        // enableInfiniteScroll: true,
        reverse: false,
        autoPlayInterval: Duration(seconds: 3),
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        // enlargeCenterPage: true,
        scrollDirection: Axis.horizontal,
      ),
      items: [
        Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: kappbar),
          child: Image.asset(
            'images/hospital/a.jpg',
            fit: BoxFit.fitWidth,
          ),
        ),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: kappbar),
          child: Image.asset(
            'images/hospital/d.jpg',
            fit: BoxFit.cover,
          ),
        ),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: kappbar),
          child: Image.asset(
            'images/hospital/y.jpg',
            fit: BoxFit.cover,
          ),
        )
      ],
      // items: photo.map((i) {
      //   return Builder(
      //     builder: (BuildContext context) {
      //       return Container(

      //           width: MediaQuery.of(context).size.width,
      //           margin:
      //               const EdgeInsets.symmetric(horizontal: 5.0, vertical: 10),
      //           decoration: BoxDecoration(
      //               borderRadius: BorderRadius.circular(20),
      //               color: Colors.amber),
      //           child: Image.asset(
      //        'images/hospital/a.jpg',
      //      fit: BoxFit.cover,
      //     ),
      //       );
      //     },
      //   );
      // }).toList(),
    );
  }
}
