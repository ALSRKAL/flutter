import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor/photoSlider/photoSliderGetx.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'package:get/get.dart';

import '../dataJson/ListOfJson.dart';

import '../screens/photoSliderditals.dart';

class photoSlider extends StatelessWidget {
  CarouselController buttonCarouselController = CarouselController();
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
                  height: MediaQuery.of(context).size.height / 4,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, i) => Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: InkWell(
                            onTap: () {
                              Get.to(Photo1slider(
                                i: i,
                                snapshot: snapshot,
                              ));
                            },
                            child: Stack(
                              children: [
                                Hero(
                                  tag: snapshot.data!.docs[i]['id'],
                                  child: Container(
                                    margin: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                    ),
                                    width:
                                        MediaQuery.of(context).size.width - 50,
                                    height: 200,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: CachedNetworkImageProvider(
                                              snapshot.data!.docs[i]['image']
                                                  .toString()),
                                          fit: BoxFit.cover),
                                      boxShadow: const [
                                        BoxShadow(
                                          spreadRadius: 1,
                                          blurRadius: 8,
                                          offset: Offset(2, 4),
                                          color: Colors.black45,
                                        ),
                                      ],
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.red,
                                    ),
                                  ),
                                ),
                                Positioned(
                                    left: 20,
                                    width: 80,
                                    child:
                                        snapshot.data!.docs[i]['Lottie'] != ''
                                            ? Lottie.network(
                                                "${snapshot.data!.docs[i]['Lottie']}",
                                              )
                                            : SizedBox()),
                                // MaterialButton(
                                //   onPressed: () {
                                //     print();
                                //   },
                                //   child: Container(
                                //     color: Colors.blue,
                                //     width: 50,
                                //     height: 50,
                                //   ),
                                // )
                              ],
                            ),
                          ))
                      //     SizedBox(
                      //   width: 150,
                      //   child: Hero(
                      //     tag: "${photoSliderList[i]['name']}",
                      //     child: Material(
                      //       shadowColor: Colors.black,
                      //       elevation: 8,
                      //       borderRadius: BorderRadius.circular(20),
                      //       clipBehavior: Clip.antiAliasWithSaveLayer,
                      //       child: Stack(
                      //         children: [
                      //           InkWell(
                      //             onTap: () {
                      //               Navigator.push(
                      //                   context,
                      //                   MaterialPageRoute(
                      //                       builder: (context) =>
                      //                           Photo1slider(i: i)));
                      //             },
                      //             child: Ink.image(
                      //               image: CachedNetworkImageProvider(
                      //                   photoSliderList[i]['image']),
                      //               fit: BoxFit.cover,
                      //               width:
                      //                   MediaQuery.of(context).size.width / 1.1,
                      //               height: 180,
                      //             ),
                      //           ),
                      //           Positioned(
                      //               left: 10,
                      //               width: 60,
                      //               child: i != 0
                      //                   ? Lottie.network(
                      //                       "${snapshot.data!.docs[i]['Lottie']}",
                      //                     )
                      //                   : const SizedBox()),
                      //           Positioned(
                      //             child: Container(
                      //               margin: const EdgeInsets.all(20),
                      //               color: Colors.red,
                      //               width: 50,
                      //               height: 50,
                      //             ),
                      //           )
                      //         ],
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      ),
                );
              } else {
                return Container();
              }
            },
          )),
    );
  }
}
