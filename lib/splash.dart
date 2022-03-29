
import 'package:blog_application/gen/assets.gen.dart';
import 'package:blog_application/home.dart';
import 'package:blog_application/onboarding.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 2)).then((value){
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) {
        return const OnBoardingScreen();
      }));
    });
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Positioned.fill(child: Assets.img.background.splash.image(fit: BoxFit.cover)),
        Center(
          child: Assets.img.icons.logo.svg(width: 100),
        )
      ],),
    );
  }
}