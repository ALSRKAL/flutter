import 'package:doctor/screens/homeScreen.dart';
import 'package:doctor/utils/langs/language_controller.dart';
import 'package:doctor/widget/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class langScreen extends StatelessWidget {
  static const String id = 'langScreen';
  langScreen({Key? key,Key }) : super(key: key);

  


  final List<String> items = ['EN', 'AR', ];

  late String  _selectedLanguage;

  String? selectedValue;

  

  String en = 'en';

  String ar = 'ar';

  @override
  
  Widget build(BuildContext context) {
    return GetBuilder<LanguageConotroller>(
      init: LanguageConotroller(),
      builder: (value) => Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('Change Language'.tr),
          centerTitle: true,
          backgroundColor: Colors.white,
          foregroundColor: kappbar,
          elevation: 2,
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            InkWell(
              onTap: () {
                  value.sevedLang.value=en;
                Get.updateLocale(Locale(en));
                value.saveLocale();
                Get.back();

                
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: kpadding),
                margin: const EdgeInsets.symmetric(
                  horizontal: kpadding * 2,
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(kpadding),
                    color: Colors.grey[200]),
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'English',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            InkWell(
              onTap: () {
                value.sevedLang.value=ar;
                Get.updateLocale(Locale(ar));
                 value.saveLocale();
                
                 Get.offNamedUntil(HomeScreen.id, (route) => false);
                 
                  
                
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: kpadding),
                margin: const EdgeInsets.symmetric(horizontal: kpadding * 2),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(kpadding),
                    color: Colors.grey[200]),
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'عربي',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ),
            
      //       DropdownButtonHideUnderline(
      //   child: DropdownButton2(
      //     hint: Text(
      //       'Select Item',
      //       style: TextStyle(
      //         fontSize: 14,
      //         color: Theme
      //                 .of(context)
      //                 .hintColor,
      //       ),
      //     ),
      //     items: items
      //             .map((item) =>
      //             DropdownMenuItem<String>(
      //               value: item,
      //               child: Text(
      //                 item,
      //                 style: const TextStyle(
      //                   fontSize: 14,
      //                 ),
      //               ),
      //             ))
      //             .toList(),
      //     value: selectedValue,
      //     onChanged: (value)async {
      //       setState(() {selectedValue = value.toString();});
              
      //       SharedPreferences pref = await SharedPreferences.getInstance();
      //       pref.setString('AR', value.toString().toLowerCase());
      //       print(pref);
            
      //       print(value);
                
      //     },
      //     buttonHeight: 40,
      //     buttonWidth: 140,
      //     itemHeight: 40,
      //   ),
      // )
          ],
        ),
      ),
    );
  }
}
