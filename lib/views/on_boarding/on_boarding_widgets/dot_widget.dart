import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/theme/app_colors.dart';

class DotWidget extends StatelessWidget {
  const DotWidget({
    super.key,
    required this.currentDot,
    required this.dotNumber,
  });

  final int currentDot;
  final int dotNumber;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 400),
      height: 8.h,
      width: currentDot == dotNumber ? 28.w : 8.w,
      decoration: BoxDecoration(
        // shape: BoxShape.circle,
        borderRadius: BorderRadius.circular(24),
        color: currentDot == dotNumber ? AppColors.primaryColor : AppColors.grayColor,
      ),
    );
  }
}
