import 'package:country_code_picker/country_code_picker.dart';
import 'package:doctor/screens/Otp_screen.dart';

import 'package:doctor/widget/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sms_autofill/sms_autofill.dart';
import '../utils/langs/language_controller.dart';
import 'getxphoneAuth/getx.dart';

class SingiIn extends StatelessWidget {
  static const String id = 'singing_Screen';

  const SingiIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<phoneAuthCrt>(
        init: phoneAuthCrt(),
        builder: (Value) {
          return Scaffold(
            appBar: AppBar(
                title: Text('Contunie with phone'.tr,style: TextStyle(color: kfont),),
                centerTitle: true,
                backgroundColor: Colors.white,
                foregroundColor: kappbar,
                elevation: 0,
                actions: [
                  GetBuilder<LanguageConotroller>(
                    init: LanguageConotroller(),
                    builder: ((value) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: DropdownButton<String>(
                            value: Value.dropdownValue,
                            icon: const Icon(Icons.translate),
                            elevation: 16,
                            style: const TextStyle(color: kbuttonColors),
                            underline: Container(
                              height: 2,
                              color: Colors.deepPurpleAccent,
                            ),
                            onChanged: (String? newValue) {
                              Value.changedropdown(newValue);
                              if (newValue == 'عربي') {
                                newValue = 'ar';

                                value.sevedLang.value = newValue;
                                Get.updateLocale(Locale(newValue));
                                value.saveLocale();
                              } else {
                                newValue = 'en';
                                value.sevedLang.value = newValue;
                                Get.updateLocale(Locale(newValue));
                                value.saveLocale();
                              }
                            },
                            items: Value.i
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList()),
                      );
                    }),
                  ),
                ]),
            backgroundColor: Colors.white,
            body: Value.showLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : SafeArea(
                    child: Column(
                      children: [
                        Expanded(
                          child: Image.asset('images/sing.gif'),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 20),
                          decoration: BoxDecoration(
                              boxShadow: const [
                                BoxShadow(
                                    blurRadius: 3,
                                    spreadRadius: 0.0,
                                    blurStyle: BlurStyle.normal,
                                    color: Color.fromARGB(221, 65, 63, 63))
                              ],
                              borderRadius: BorderRadius.circular(20),
                              color: kprimryColors),
                          child: Column(
                            children: [
                              const SizedBox(height: 20),
                              Row(
                                children: [
                                  CountryCodePicker(
                                    onChanged: (CountryCode) {
                                      Value.initialCode = CountryCode.dialCode!;
                                    },
                                    showFlagMain: false,
                                    initialSelection: Value.initialCode,
                                    favorite: const ['+91', '+967'],
                                  ),
                                  Flexible(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20),
                                      child: TextField(
                                        cursorColor: kappbar,
                                        controller: Value.phoneController,
                                        onChanged: (text) {},
                                        decoration: InputDecoration(
                                          focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                              borderSide: const BorderSide(
                                                  color: kappbar)),
                                          border: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: kbuttonColors),
                                            borderRadius:
                                                BorderRadius.circular(30),
                                          ),
                                          hintText: 'Mobile Number'.tr,
                                        ),
                                        keyboardType: TextInputType.number,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              MaterialButton(
                                  elevation: 3,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 50, vertical: 10),
                                  color: kappbar,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Text(
                                    'Send'.tr,
                                    style:
                                        const TextStyle(color: kfont),
                                  ),
                                  onPressed: ()async {


                                      if ((Value.phoneController.text).length <=
                                          0) {
                                        Value.showLoading = false;
                                        Get.rawSnackbar(
                                            title: 'Erorr'.tr,
                                            message: 'fill blank'.tr,
                                            overlayBlur: 2.5,
                                            icon: const Icon(Icons.close,color: Colors.red,));
                                      } else {
                                        Value.showLoading = true;
                                        Value.result = Value.initialCode +
                                            Value.phoneController.text;
                                        Value.fetchotp(context)
                                            .then((value) => null)
                                            .catchError(
                                              (e) => Get.rawSnackbar(
                                                  title: 'Erorr',
                                                  message:
                                                      'something went wrong ${e}'),
                                            );
                                            final signature = await SmsAutoFill().getAppSignature;
                                            print(signature);
                                      }
                                  }),
                              const SizedBox(height: 20),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
          );
        });
  }
}
