import 'package:doctor/screens/heart%20disease/heartDiseasJsonList.dart';
import 'package:doctor/widget/colors.dart';
import 'package:flutter/material.dart';


class heartDisease extends StatelessWidget {
  const heartDisease({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: kprimryColors,
          boxShadow: const [
            BoxShadow(blurRadius: 5, spreadRadius: 0.5, color: Colors.black26)
          ]),
      width: width - 40,
      height: 200,
      child: SizedBox(
        width: width - 50,
        height: 200,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: GridView.builder(
            padding: const EdgeInsets.symmetric(vertical: 15),
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
            ),
            itemCount: heartDiseaseList.length,
            itemBuilder: (context, i) => Stack(
              children: [
                InkWell(
                  onTap: () {},
                  child: Container(
                    margin: const EdgeInsets.only(left: 10, top: 5),
                    width: width,
                    height: 150,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 5,
                            spreadRadius: 0.5,
                            color: Colors.black.withOpacity(0.5))
                      ],
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                          image: AssetImage(heartDiseaseList[i]['photo']),
                          fit: BoxFit.cover),
                      color: Colors.grey,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 5, top: 5),
                  width: width,
                  height: 150,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomRight,
                      colors: [
                        Colors.black.withOpacity(0.5),
                        kappbar.withOpacity(0.1)
                      ],
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
