import 'dart:async';

import 'package:doctor/screens/Otp_screen.dart';
import 'package:doctor/screens/homeScreen.dart';
import 'package:doctor/screens/singin.dart';
import 'package:doctor/widget/Snakbar.dart';
import 'package:doctor/widget/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class phoneAuthCrt extends GetxController {
  final phoneController = TextEditingController();
  final Otpcontroller = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;
  String _verificationid = "";
  bool showLoading = false;

  RxBool wait = true.obs;
  List<String> i = ['English', 'عربي'];
  String dropdownValue = 'English';
  late String newValue;
  String result = '';
  String initialCode = '+91';
  var num = 0.obs;
  RxString resend = 'RESEND'.obs;

  void signInwithPhoneAuthCredential(
      PhoneAuthCredential phoneAuthCredential, context) async {
    showLoading = true;

    try {
      final userCredential =
          await auth.signInWithCredential(phoneAuthCredential);
      showLoading = false;
      if (userCredential.user != null) {
        Get.offNamed(HomeScreen.id);
      }
    } on FirebaseAuthException catch (e) {
      snackbar(text: 'Wrong code Try again'.tr, context: context);
    }
  }

  Future<void> verify(var otp, context) async {
    PhoneAuthCredential phoneAuthCredential = PhoneAuthProvider.credential(
        verificationId: _verificationid, smsCode: otp);
    signInwithPhoneAuthCredential(phoneAuthCredential, context);

    update();
  }

  Future<void> fetchotp(context) async {
    await auth.verifyPhoneNumber(
        phoneNumber: result,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await auth.signInWithCredential(credential).then((value) async {});
        },
        verificationFailed: (FirebaseAuthException e) {
          showLoading = false;
          if (e.code == 'invalid-phone-number') {
            Get.rawSnackbar(
                title: 'Erorr'.tr,
                message: 'invalid phone number'.tr,
                backgroundColor: Colors.red,
                overlayBlur: 1.5);
            Get.offNamedUntil(SingiIn.id, ((route) => false));
            print('invalid phone number');
          }
        },
        codeSent: (String verificationid, int? resendToken) async {
          showLoading = false;
          _verificationid = verificationid;
          Get.offNamedUntil(OtpScreen.id, (route) => false);
        },
        codeAutoRetrievalTimeout: (String verificationid) {
          verificationid = verificationid;
        });

    update();
  }

  void changedropdown(value) {
    dropdownValue = value;
    update();
  }

  Future<void> siginOut() async {
    await auth.signOut();
  }

  confirmSignOut() {
    Get.defaultDialog(
        title: 'Confrim Sign Out'.tr,
        middleText: 'Do you really want to sign out ?'.tr,
        textCancel: 'Cancel'.tr,
        textConfirm: 'Confrim'.tr,
        buttonColor: kappbar,
        confirmTextColor: Colors.white,
        onConfirm: () {
          siginOut();

          SystemNavigator.pop();
        });
  }
}
