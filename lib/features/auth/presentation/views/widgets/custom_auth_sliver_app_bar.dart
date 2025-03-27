import 'package:doctor_app/core/utils/app_colors.dart';
import 'package:doctor_app/core/utils/app_icons.dart';
import 'package:doctor_app/core/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class CustomAuthSliverAppBar extends StatelessWidget {
  const CustomAuthSliverAppBar({
    super.key,
    this.canGoBack = false,
  });
  final bool canGoBack;
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      leading: canGoBack
          ? IconButton(
              icon: SvgPicture.asset(
                AppIcons.svgsAuthBackIcon,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          : null,
      automaticallyImplyLeading: false,
      backgroundColor: AppColors.primaryColor,
      pinned: true,
      expandedHeight: 200.h,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Image.asset(
          AppImages.imagesAuthHeader,
          height: 100.h,
        ),
      ),
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(20),
        child: Container(
          width: double.infinity,
          height: 20,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50.r),
              topRight: Radius.circular(50.r),
            ),
          ),
        ),
      ),
    );
  }
}
