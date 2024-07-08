import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gobar/theme/app_colors.dart';

class MainOnboarding extends StatefulWidget {
  const MainOnboarding({super.key});

  @override
  State<MainOnboarding> createState() => _MainOnboardingState();
}

class _MainOnboardingState extends State<MainOnboarding> {
  PageController pageController = PageController();
  int currentPage = 0;
  int currentDot = 0;
  double titleOpacity = 0;
  double descriptionOpacity = 0;
  List<String> pictures = [
    'assets/images/on1.png',
    'assets/images/on2.png',
    'assets/images/on3.png'
  ];
  Map<String, String> onDescription = {
    "Welcome Gobars":
        "Find the best grooming experience in your city with just one tap! Don't miss out on the haircut or treatment of your dreams. Let's start now!",
    "Loooking for barber?":
        "Find the best barbershop around you in seconds, make an appointment, and enjoy the best grooming experience.",
    "Everything in your hands":
        "With Gobar, find high-quality barbershops, see reviews, and make appointments easily. Achieve your confident appearance!",
  };
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(
      Duration(milliseconds: 200),
      () {
        setState(() {
          titleOpacity = 1;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
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
                  pictures[index],
                );
              },
              itemCount: 3,
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
                    opacity: titleOpacity,
                    duration: Duration(milliseconds: 300),
                    onEnd: () {
                      if (titleOpacity == 1) {
                        setState(() {
                          descriptionOpacity = 1;
                        });
                      } else {
                        setState(() {
                          descriptionOpacity = 0;
                        });
                      }
                    },
                    child: Text(
                      onDescription.keys.elementAt(currentPage),
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
                      opacity: descriptionOpacity,
                      duration: Duration(milliseconds: 200),
                      onEnd: () {
                        if (titleOpacity == 0) {
                          setState(() {
                            titleOpacity = 1;
                          });
                        }
                        // setState(() {
                        // });
                      },
                      child: Text(
                        onDescription.values.elementAt(currentPage),
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
                      AnimatedContainer(
                        duration: Duration(milliseconds: 400),
                        height: 8.h,
                        width: currentDot == 0 ? 28.w : 8.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          color: currentDot == 0 ? AppColors.primaryColor : AppColors.grayColor,
                        ),
                      ),
                      SizedBox(
                        width: 8.w,
                      ),
                      AnimatedContainer(
                        duration: Duration(milliseconds: 400),
                        height: 8.h,
                        width: currentDot == 1 ? 28.w : 8.w,
                        decoration: BoxDecoration(
                          // shape: BoxShape.circle,
                          borderRadius: BorderRadius.circular(24),

                          color: currentDot == 1 ? AppColors.primaryColor : AppColors.grayColor,
                        ),
                      ),
                      SizedBox(
                        width: 8.w,
                      ),
                      AnimatedContainer(
                        duration: Duration(milliseconds: 400),
                        height: 8.h,
                        width: currentDot == 2 ? 28.w : 8.w,
                        decoration: BoxDecoration(
                          // shape: BoxShape.circle,
                          borderRadius: BorderRadius.circular(24),
                          color: currentDot == 2 ? AppColors.primaryColor : AppColors.grayColor,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 18.h,
                  ),
                  GestureDetector(
                    onTap: () {
                      if (currentPage == 2) {
                        return;
                      }

                      currentDot++;
                      pageController
                          .nextPage(
                        duration: Duration(milliseconds: 400),
                        curve: Curves.linear,
                      )
                          .then(
                        (value) {
                          setState(() {
                            titleOpacity = 0;

                            Future.delayed(
                              Duration(milliseconds: 400),
                              () {
                                currentPage++;
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
                          currentPage != 2 ? "Next" : "Get Started",
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
          )
        ],
      ),
    );
  }
}
