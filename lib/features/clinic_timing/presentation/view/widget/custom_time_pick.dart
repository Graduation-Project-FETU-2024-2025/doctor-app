import 'dart:developer';
import 'package:doctor_app/core/utils/app_colors.dart';
import 'package:doctor_app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import '../../../../../core/utils/app_icons.dart';
import '../../../../../core/widgets/custom_edit_text_form_field.dart';
import '../../../../../generated/l10n.dart';

class CustomTimePick extends StatefulWidget {
  const CustomTimePick({super.key, required this.startTime, required this.endTime});
  final String startTime;
  final String endTime;
  @override
  State<CustomTimePick> createState() => _CustomTimePickState();
}

class _CustomTimePickState extends State<CustomTimePick> {
  String startTime = '00:00';
  String endTime = '00:00';
  @override
  Widget build(BuildContext context) {
    getTimeFromUser({required bool isStartTime}) async {
      TimeOfDay? pickedDate = await showTimePicker(
        context: context,
        initialTime: isStartTime
            ? TimeOfDay.fromDateTime(DateTime.now())
            : TimeOfDay.fromDateTime(
                DateTime.now().add(const Duration(minutes: 15))),
      );

      String formattedTime = pickedDate!.format(context);
      if (isStartTime) {
        setState(() {
          // Cubit.get(context).startTimeController.text =
          //     formattedTime;
          startTime = formattedTime;
        });
      } else if (!isStartTime) {
        setState(() {
          // Cubit.get(context).endTimeController.text =
          //   formattedTime;
          endTime = formattedTime;
        });
      } else {
        log('pick date error');
      }
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 100,
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      S.of(context).startTime,
                      style: AppStyles.semiBold14(context),
                    ),
                    Gap(18.h),
                    CustomEditTextFormField(
                      controller: TextEditingController(),
                      // Cubit.get(context).startTimeController,
                      hintTxt: widget.startTime,
                      initialVal: widget.startTime,
                      suffixIcon: IconButton(
                        onPressed: () => getTimeFromUser(isStartTime: true),
                        icon: SvgPicture.asset(
                          AppIcons.iconTime,
                          colorFilter: ColorFilter.mode(
                              Theme.of(context).brightness == Brightness.light
                                  ? AppColors.black.withOpacity(0.7)
                                  : AppColors.white.withOpacity(0.7),
                              BlendMode.srcIn),
                        ),
                      ),
                      readOnly: true,
                    ),
                  ],
                ),
              ),
              Gap(19.h),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      S.of(context).endTime,
                      style: AppStyles.semiBold14(context),
                    ),
                    Gap(18.h),
                    CustomEditTextFormField(
                      controller: TextEditingController(),
                      // Cubit.get(context).endTimeController,
                      hintTxt: widget.endTime,
                      initialVal: widget.endTime,
                      suffixIcon: IconButton(
                        onPressed: () => getTimeFromUser(isStartTime: false),
                        icon: SvgPicture.asset(
                          AppIcons.iconTime,
                          colorFilter: ColorFilter.mode(
                              Theme.of(context).brightness == Brightness.light
                                  ? AppColors.black.withOpacity(0.7)
                                  : AppColors.white.withOpacity(0.7),
                              BlendMode.srcIn),
                        ),
                      ),
                      readOnly: true,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
