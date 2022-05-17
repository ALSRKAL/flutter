import 'package:country_code_picker/country_localizations.dart';
import 'package:doctor/screens/Otp_screen.dart';
import 'package:doctor/screens/User_information.dart';
import 'package:doctor/screens/homeScreen.dart';
import 'package:doctor/screens/singin.dart';
import 'package:doctor/screens/LanguageScreen.dart';
import 'package:doctor/screens/splashScreen.dart';
import 'package:doctor/utils/langs/translation.dart';
import 'package:doctor/widget/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'ErorrWidget.dart';

void main() async {
  await GetStorage.init();
  customErrorScreen();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: kappbar),
      ),
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        CountryLocalizations.delegate,
      ],
      locale: const Locale('en'),
      fallbackLocale: const Locale('en'),
      // supportedLocales: const [Locale('en', 'US')],
      translations: translation(),

      initialRoute: _auth.currentUser != null ? HomeScreen.id : SingiIn.id,
      //
      routes: {
        SplashScreen.id: (context) => const SplashScreen(),
        SingiIn.id: (context) => const SingiIn(),
        OtpScreen.id: (context) => const OtpScreen(),
        HomeScreen.id: (context) => HomeScreen(),
        profiel.id: (context) => profiel(),
        langScreen.id: (context) => langScreen(),
      },
    );
  }
}
