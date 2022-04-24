import 'package:doctor/screens/GetxHome/homeGetx.dart';
import 'package:doctor/screens/drawer.dart';
import 'package:doctor/widget/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widget/SearchBar.dart';
import '../widget/photoSlider.dart';

class HomeScreen extends StatelessWidget {
  static const String id = 'HomeScreen';
  @override
  Widget build(BuildContext context) {
    var m = AppBar().preferredSize.height;
    return GetBuilder<Homecrt>(
      init: Homecrt(),
      builder: ((value) => Scaffold(
            backgroundColor: kprimryColors,
            appBar: AppBar(
              flexibleSpace: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20)),
                ),
              ),
              centerTitle: true,
              backgroundColor: kappbar,
              title: const Text(
                'H O M E ',
                style: TextStyle(color: kfont),
              ),
              actions: [
                IconButton(
                    onPressed: () {
                      showSearch(context: context, delegate: DataSearch());
                    },
                    icon: const Icon(Icons.search))
              ],
            ),
            body: Column(children: [
              const SizedBox(
                height: 15,
              ),
              photoSlider()
            ]),
            drawer: Padding(
              padding: EdgeInsets.only(top: m),
              child: Drawar(),
            ),
          )),
    );
  }
}


