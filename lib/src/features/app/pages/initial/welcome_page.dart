


import 'package:cat_flutter_project/src/core/settings/app_fonts.dart';
import 'package:cat_flutter_project/src/features/app/pages/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';


class SplashScreen extends StatefulWidget {
  static const routeName = '/splash_Screen';
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();

}



class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5),()=>Get.toNamed(HomePage.routeName));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:   SafeArea(
        child: SizedBox(
          child: Stack(
            children: [
              SizedBox(
                  height: double.infinity,
                  child: Image.asset(
                      fit: BoxFit.contain,
                      'assets/img.png')),
              Positioned(
                  top: 120.h,
                  left: 100.w,
                  child: Text('CATS WORLD',style: AppFonts.pTextW7S22, textAlign: TextAlign.center,)),
              Positioned(
                  left: 120.w,
                  bottom: 170.h,
                  child:  Text('Bienvenido',style: AppFonts.pTextW7S22,textAlign: TextAlign.center,)),
            ],
          ),
        ),
      ),
    );
  }
}
