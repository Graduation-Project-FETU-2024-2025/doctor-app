import 'package:doctor_app/core/utils/app_colors.dart';
import 'package:doctor_app/core/utils/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomProfileImage extends StatelessWidget {
  const CustomProfileImage({
    super.key, required this.imagePath,
  });
  final String imagePath;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          radius: 45.r,
          backgroundColor: AppColors.gray,
          backgroundImage: AssetImage(imagePath),
        ),
        Positioned(
          bottom: -10,
          right: -6,
          child: IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              AppIcons.svgsCamera,
            ),
          ),
        ),
      ],
    );
  }
}
