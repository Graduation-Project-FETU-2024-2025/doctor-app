
import 'package:doctor_app/core/utils/app_icons.dart';
import 'package:doctor_app/features/profile/presentation/view/widgets/custom_profile_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class UserInfoWidget extends StatelessWidget {
  const UserInfoWidget({
    super.key, required this.imagePath, required this.name,
  });
  final String imagePath;
  final String name;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomProfileImage(imagePath: imagePath,),
        Gap(25.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              name,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(AppIcons.svgsEditsvg),
            ),
          ],
        ),
      ],
    );
  }
}
