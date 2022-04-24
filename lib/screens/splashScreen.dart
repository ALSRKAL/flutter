import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:doctor/screens/homeScreen.dart';
import 'package:doctor/screens/singin.dart';
import 'package:doctor/widget/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  static const String id = 'SplashScreen';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final auth=FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        splashIconSize: 250,
        splashTransition: SplashTransition.fadeTransition,
        backgroundColor: kbuttonColors,
        animationDuration:const Duration(seconds: 1),
        splash: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child: Container(
              width: MediaQuery.of(context).size.width,
              height: 100,
              child: Lottie.asset('images/splash.json'))),
              const SizedBox(height: 20,),
              const Text('TEXT TEST ',style: TextStyle(color: kfont,fontSize: 18),)
          ],
        ),
        nextScreen: auth.currentUser!=null?HomeScreen(): SingiIn(),);
  }
}
