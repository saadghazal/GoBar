import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:gobar/controllers/onboarding_controller.dart';

import '../../utils/theme/app_colors.dart';
import 'on_boarding_widgets/dot_widget.dart';

class MainOnboarding extends StatefulWidget {
  const MainOnboarding({super.key});

  static const routeName = '/onboarding';

  @override
  State<MainOnboarding> createState() => _MainOnboardingState();
}

class _MainOnboardingState extends State<MainOnboarding> {
  PageController pageController = PageController();
  OnboardingController onboardingController = Get.find();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    onboardingController.initTitleOpacity();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnboardingController>(
      // assignId: true,
      builder: (_) {
        return Scaffold(
          body: Stack(
            children: [
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                bottom: 200,
                child: PageView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  controller: pageController,
                  itemBuilder: (context, index) {
                    return Image.asset(
                      onboardingController.pictures[index],
                    );
                  },
                  itemCount: onboardingController.pictures.length,
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 253.h,
                  width: double.maxFinite,
                  padding: EdgeInsets.only(left: 18.w, right: 18.w, top: 24.h),
                  decoration: BoxDecoration(
                    color: AppColors.secondaryColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(28.r),
                      topRight: Radius.circular(28.r),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AnimatedOpacity(
                        opacity: onboardingController.titleOpacity,
                        duration: Duration(milliseconds: 300),
                        onEnd: () {
                          if (onboardingController.titleOpacity == 1) {
                            onboardingController.descriptionOpacity = 1;
                          } else {
                            onboardingController.descriptionOpacity = 0;
                          }
                        },
                        child: Text(
                          onboardingController.onDescription.keys
                              .elementAt(onboardingController.currentPage),
                          style: TextStyle(
                            fontSize: 24.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 30.w),
                        child: AnimatedOpacity(
                          opacity: onboardingController.descriptionOpacity,
                          duration: Duration(milliseconds: 200),
                          onEnd: () {
                            if (onboardingController.titleOpacity == 0) {
                              onboardingController.titleOpacity = 1;
                            }
                          },
                          child: Text(
                            onboardingController.onDescription.values
                                .elementAt(onboardingController.currentPage),
                            style: TextStyle(
                              fontSize: 13.5.sp,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 18.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          DotWidget(
                            currentDot: onboardingController.currentDot,
                            dotNumber: 0,
                          ),
                          SizedBox(
                            width: 8.w,
                          ),
                          DotWidget(
                            currentDot: onboardingController.currentDot,
                            dotNumber: 1,
                          ),
                          SizedBox(
                            width: 8.w,
                          ),
                          DotWidget(
                            currentDot: onboardingController.currentDot,
                            dotNumber: 2,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 18.h,
                      ),
                      GestureDetector(
                        onTap: () {
                          if (onboardingController.currentPage == 2) {
                            return;
                          }

                          onboardingController.incrementCurrentDot();
                          pageController
                              .nextPage(
                            duration: Duration(milliseconds: 400),
                            curve: Curves.linear,
                          )
                              .then(
                            (value) {
                              setState(() {
                                onboardingController.titleOpacity = 0;

                                Future.delayed(
                                  Duration(milliseconds: 400),
                                  () {
                                    onboardingController.incrementCurrentPage();
                                  },
                                );
                              });
                            },
                          );
                        },
                        child: Container(
                          height: 54.h,
                          width: double.maxFinite,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.r),
                            color: AppColors.primaryColor,
                          ),
                          child: Center(
                            child: Text(
                              onboardingController.currentPage != 2 ? "Next" : "Get Started",
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
