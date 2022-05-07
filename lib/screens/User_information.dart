import 'package:doctor/GetxProfile/Getxprofile.dart';
import 'package:doctor/screens/homeScreen.dart';
import 'package:doctor/utils/langs/en.dart';
import 'package:doctor/utils/langs/language_controller.dart';
import 'package:doctor/widget/colors.dart';
import 'package:doctor/widget/detils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

class profiel extends StatelessWidget {
  static const String id = 'UserInfo';
  profiel({Key? key}) : super(key: key);

  final auth = FirebaseAuth.instance;
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<GetProfile>(
        init: GetProfile(),
        builder: ((value) => Scaffold(
              backgroundColor: kprimryColors,
              appBar: AppBar(
                leading: value.editbool
                    ? IconButton(
                        onPressed: () {
                          
                          Get.toNamed(HomeScreen.id);
                        },
                        icon: Icon(Icons.arrow_back))
                    : Container(),
                actions: [
                  if (value.editbool)
                    IconButton(
                        onPressed: () {
                          value.editswitch();
                        },
                        icon: const Icon(Icons.edit))
                  else
                    IconButton(
                        onPressed: () {
                          if (value.Emailcontroller.text == '' ||
                              value.UserNamecontroller.text == '') {
                            value.check();
                          } else {
                            value.editswitch();
                            value
                                .usernameStorage(value.UserNamecontroller.text);
                            value.UserEmailStorage(value.Emailcontroller.text);
                          }
                        },
                        icon: const Icon(Icons.cancel))
                ],
                centerTitle: true,
                title: GetBuilder<LanguageConotroller>(
                    init: LanguageConotroller(),
                    builder: ((v) => Text('Profile'.tr))),
                backgroundColor: kappbar,
              ),
              body: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Stack(children: [
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(50),
                                image: DecorationImage(
                                    image: value.photoholder
                                        ? const AssetImage('images/faces/0.png')
                                        : const AssetImage(
                                            'images/faces/1.png'),
                                    fit: BoxFit.scaleDown)),
                            width: 100,
                            height: 100,
                          ),
                          value.editbool
                              ? Container()
                              : Positioned(
                                  top: 60,
                                  left: 60,
                                  child: CircleAvatar(
                                    radius: 20,
                                    child: IconButton(
                                        onPressed: () {
                                          value.photochanger();
                                        },
                                        icon: const Icon(
                                          Icons.swap_horiz_outlined,
                                          color: Colors.black,
                                        )),
                                  ),
                                )
                        ])
                      ],
                    ),
                  ),
                  const SizedBox(height: 25),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 100),
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          height: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.grey[200]),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.person,
                                color: kappbar,
                              ),
                              const SizedBox(width: 15),
                              value.editbool
                                  ? Flexible(
                                      child: Text(
                                      value.box.read('username').toString(),
                                      overflow: TextOverflow.ellipsis,
                                    ))
                                  : Flexible(
                                      child: TextField(
                                          controller: value.UserNamecontroller))
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          height: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.grey[200]),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.email,
                                color: kappbar,
                              ),
                              const SizedBox(width: 15),
                              value.editbool
                                  ? Flexible(
                                      child: Text(
                                      value.box.read('email').toString(),
                                      overflow: TextOverflow.ellipsis,
                                    ))
                                  : Flexible(
                                      child: TextField(
                                          controller: value.Emailcontroller))
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          height: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.grey[200]),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.phone,
                                color: kappbar,
                              ),
                              const SizedBox(width: 15),
                              SelectableText(
                                "${auth.currentUser?.phoneNumber.toString()}",
                                style: const TextStyle(),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        if (value.editbool)
                          Container()
                        else
                          ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: MaterialButton(
                              onPressed: () async {
                                if (value.Emailcontroller.text == '' ||
                                    value.UserNamecontroller.text == '') {
                                  value.check();
                                } else {
                                  value.usernameStorage(
                                      value.UserNamecontroller.text);
                                  value.UserEmailStorage(
                                      value.Emailcontroller.text);
                                  value.editswitch();
                                }
                              },
                              child: const Text('Save'),
                              color: kappbar,
                            ),
                          ),
                          
                      ],
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
