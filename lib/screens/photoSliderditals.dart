import 'package:doctor/dataJson/ListOfJson.dart';
import 'package:doctor/getxphotoSlider/GetxPhotoslider.dart';
import 'package:doctor/utils/langs/language_controller.dart';
import 'package:doctor/widget/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:get/state_manager.dart';

class Photo1slider extends StatelessWidget {
  final i;

  Photo1slider({Key? key, required this.i}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.grey.shade300,
          elevation: 0,
          foregroundColor: kappbar,
          title: Text(
            "${photoSliderList[i]['title']}",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              overflow: TextOverflow.ellipsis,
            ),
            maxLines: 1,
          ),
        ),
        backgroundColor: Colors.grey[300],
        body: SafeArea(
          child: SingleChildScrollView(
            child: GetBuilder<PhotoSliderGetx>(
              init: PhotoSliderGetx(),
              builder: ((v) => GetBuilder<LanguageConotroller>(
                    init: LanguageConotroller(),
                    builder: ((value) => (Column(
                          children: [
                            Hero(
                              tag: '${photoSliderList[i]['name']}',
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.black.withOpacity(0.2),
                                ),
                                padding: const EdgeInsets.all(1),
                                margin: const EdgeInsets.all(10),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.asset(
                                      '${photoSliderList[i]['photo']}'),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              width: 200,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: MaterialButton(
                                  elevation: 2,
                                  onPressed: () {},
                                  color: kappbar,
                                  child: Text(
                                    'Book'.tr,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(kpadding),
                              margin: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white),
                              child: Column(
                                children: [
                                  Text(
                                    "${photoSliderList[i]['title']}",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    "${photoSliderList[i]['subtitle']}",
                                    style:
                                        TextStyle(overflow: TextOverflow.fade),
                                    maxLines: v.readmore ? null : v.maxline,
                                  ),
                                 
                                    TextButton(
                                      onPressed: () {
                                        v.reedmore();
                                      },
                                      child: v.readmore
                                          ? Text('less'.tr)
                                          : Text('more..'.tr),
                                    )
                                ],
                              ),
                            )
                          ],
                        ))),
                  )),
            ),
          ),
        ));
  }
}
