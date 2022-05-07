import 'package:doctor/pref_service.dart';
import 'package:doctor/widget/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get_storage/get_storage.dart';

class GetProfile extends GetxController {
  bool editbool = true;
  bool photoholder = true;

  final box = GetStorage();

  TextEditingController UserNamecontroller = TextEditingController();
  TextEditingController Emailcontroller = TextEditingController();
  void editswitch() {
    editbool = !editbool;

    update();
  }

  void usernameStorage(username) {
    box.write('username', username);
  }

  void UserNameread() {
    box.read('username');
  }

  void UserEmailStorage(emial) {
    box.write('email', emial);
  }

  void UserEmailRead() {
    box.read('email');
  }

  void photochanger() async {
    var photo = photoholder = !photoholder;
    var d = await box.write('photo', photo);

    update();
  }

  void check() async {
    if (Emailcontroller.text == '' || UserNamecontroller.text == '') {
      await Get.rawSnackbar(
          title: 'Erorr',
          message: 'user name and Email  can\'t be empty',
          backgroundColor: Colors.red,overlayBlur: 5);
    }
  }
 
}