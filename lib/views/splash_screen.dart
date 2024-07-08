import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:gobar/views/on_boarding/main_onboarding.dart';

import '../theme/app_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(
      Duration(seconds: 2),
      () {
        Get.to(() => MainOnboarding());
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Center(
        child: Image.asset(
          "assets/images/LOGO_GOBAR.png",
          height: 142,
          width: 100,
        ),
      ),
    );
  }
}
