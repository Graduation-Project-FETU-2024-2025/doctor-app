import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_icons.dart';
import 'delete_button.dart';

class RowBtn extends StatelessWidget {
  const RowBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        DeleteButton(),
        Gap(35.w),
        SizedBox(
          width: 40.w,
          height: 40.h,
          child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor:
                    const WidgetStatePropertyAll(AppColors.primaryColor),
                shape: WidgetStatePropertyAll(
                  const CircleBorder(),
                ),
                padding: const WidgetStatePropertyAll(
                  EdgeInsets.all(10),
                ),
              ),
              onPressed: () {
                //TODO
              },
              child: SvgPicture.asset(
                AppIcons.svgsEditIcon,
                colorFilter: ColorFilter.mode(Colors.white, BlendMode.dst),
              )),
        ),
      ],
    );
  }
}
