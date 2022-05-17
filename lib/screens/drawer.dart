import 'package:doctor/screens/User_information.dart';
import 'package:doctor/screens/getxphoneAuth/getx.dart';
import 'package:doctor/widget/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/get_utils/get_utils.dart';
import '../GetxProfile/Getxprofile.dart';
import 'LanguageScreen.dart';

class Drawar extends StatelessWidget {
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
   
   return GetBuilder<phoneAuthCrt>(
     init: phoneAuthCrt(),
     builder: ((value)=>
      Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(20)),
                child: Drawer(
                  backgroundColor: kprimryColors,
                  child: ListView(
                    children: [
                      InkWell(
                        //User information
                        onTap: () {
                          Get.toNamed(profiel.id);
                          
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 15, right: 8, left: 8, bottom: 10),
                          child: Row(
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.black12,
                                child: Image.asset('images/faces/0.png'),
                              ),
                              const SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  GetBuilder<GetProfile>(
                                    init:GetProfile(),
                                    builder:((v)=>
                                    
                                    v.box.read('username')==null?const Text('User name'):
                                     Text(
                                      v.box.read('username'),
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold)
                                    )
                                  )),
                                  const SizedBox(height: 5),
                                  Text('${auth.currentUser?.phoneNumber}')
                                ],
                              ),
                              const Spacer(),
                              const Icon(Icons.arrow_forward_ios_rounded)
                            ],
                          ),
                        ),
                      ),
                      const Divider(),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: InkWell(
                          onTap: () {
                            
                          },
                          child: SizedBox(
                            height: 40,
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.help_outline_rounded,
                                  color: kappbar,
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  'Need Help?'.tr,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      const Divider(),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: InkWell(
                          onTap: () {},
                          child: SizedBox(
                            height: 40,
                            child: Row(
                              children: [
                                const Icon(Icons.favorite_border,
                                    color: Colors.red),
                                const SizedBox(width: 5),
                                Text(
                                  'Your Favorite'.tr,
                                  style:const TextStyle(fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      const Divider(),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          children: [
                            
                            Text(
                              'Language switcher'.tr,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: InkWell(
                          onTap: () {
                            Get.to(() => langScreen());
                            
                          },
                          child: SizedBox(
                            height: 40,
                            child: Row(
                              children: [
                               
                                const Icon(
                                  Icons.translate_outlined,
                                  color: kappbar,
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  'Change Language'.tr,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                                
                              ],
                            ),
                          ),
                        ),
                      ),
                      const Divider(),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: InkWell(
                          onTap: () {
                            
                            value.confirmSignOut();
                            
                            
                          },
                          child: SizedBox(
                            height: 40,
                            child: Row(
                              children: [
                                
                                
                               
                                const Icon(
                                  Icons.power_settings_new_rounded,
                                  color: Color.fromARGB(255, 253, 17, 0),
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  'Sign out'.tr,

                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                                
                              ],
                            ),
                          ),
                        ),
                      ),
                      const Divider(),
                       
                    ],
                  ),
                ),
             
              
     ))
   );
  }
}
