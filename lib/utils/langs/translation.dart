import 'package:doctor/utils/langs/ar.dart';
import 'package:doctor/utils/langs/en.dart';
import 'package:get/get_navigation/src/root/internacionalization.dart';

class translation extends Translations{
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys =>{
    'en':en,
    'ar':ar
  };
}