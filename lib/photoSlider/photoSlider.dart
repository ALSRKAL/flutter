import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor/photoSlider/photoSliderGetx.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'package:get/get.dart';

import '../dataJson/ListOfJson.dart';

import '../screens/photoSliderditals.dart';

class photoSlider extends StatelessWidget {
  photoSlider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PhotoSliderGet>(
        init: PhotoSliderGet(),
        builder: ((v) => FutureBuilder<QuerySnapshot>(
              future: v.firestoreRef.collection(v.collectionName).get(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasError) {
                  return const Center(
                    child: Text('Failed'),
                  );
                } else if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
                  return SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 150,
                    child: ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, i) => Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 8),
                        child: Row(
                          children: [
                            const SizedBox(
                              width: 8,
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
                                                builder: (context) =>
                                                    Photo1slider(i: i)));
                                      },
                                      child: Ink.image(
                                        image: NetworkImage(
                                            snapshot.data!.docs[i]['image']),
                                        fit: BoxFit.cover,
                                        width:
                                            MediaQuery.of(context).size.width /
                                                1.1,
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
                } else {
                  return Container();
                  // SizedBox(
                  //     width: MediaQuery.of(context).size.width,
                  //     height: MediaQuery.of(context).size.height,
                  //     child: const Center(child: Text('No Data Found')));
                }
              },
            )));
  }
}
