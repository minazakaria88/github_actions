import 'package:device_preview/device_preview.dart';
import 'package:flower/on_boarding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(DevicePreview(builder:(context) =>  const FlowerApp()));
}

class FlowerApp extends StatelessWidget {
  const FlowerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder:(context, child) =>  const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: OnBoardingScreen()
      ),
    );
  }
}
