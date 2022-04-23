
import 'package:doctor/pref_service.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/state_manager.dart';

class LanguageConotroller extends GetxController{
  final PrefService _prefService= PrefService();

  var sevedLang = 'EN'.obs;

  saveLocale(){
    _prefService.createString('locale', sevedLang.value);
  }
  Future<void>setLocale()async{
    _prefService.readString('locale').then((value){
      if(value !='' && value !=null){
        Get.updateLocale(Locale(value.toString().toLowerCase()));
        sevedLang.value = value.toString();
        // update();
      }
    });
  }
  @override
  void onInit()async{
    setLocale();
    super.onInit();
  }
}