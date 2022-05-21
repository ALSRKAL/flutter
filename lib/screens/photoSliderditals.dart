import 'package:doctor/dataJson/ListOfJson.dart';
import 'package:doctor/getxphotoSlider/GetxPhotoslider.dart';
import 'package:doctor/utils/langs/language_controller.dart';
import 'package:doctor/widget/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:get/state_manager.dart';

class Photo1slider extends StatelessWidget {
  final i;
  final snapshot;

  const Photo1slider({Key? key, required this.i, this.snapshot})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: kprimryColors,
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
        backgroundColor: kprimryColors,
        body: SafeArea(
          child: SingleChildScrollView(
            child: GetBuilder<PhotoSliderGetx>(
              init: PhotoSliderGetx(),
              builder: ((v) => GetBuilder<LanguageConotroller>(
                    init: LanguageConotroller(),
                    builder: ((value) => (Column(
                          children: [
                            Hero(
                              tag: snapshot.data!.docs[i]['id'],
                              child: Container(
                                width: MediaQuery.of(context).size.width - 50,
                                height: 200,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.black.withOpacity(0.2),
                                ),
                                padding: const EdgeInsets.all(1),
                                margin: const EdgeInsets.all(10),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.network(
                                    '${snapshot.data!.docs[i]['image']}',
                                    fit: BoxFit.cover,
                                  ),
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
                                    style: const TextStyle(
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
                                    style: const TextStyle(
                                        overflow: TextOverflow.fade),
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
