import 'package:doctor_app/core/utils/app_colors.dart';
import 'package:doctor_app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import '../../../../../core/utils/app_icons.dart';
import '../../../../../core/widgets/custom_edit_text_form_field.dart';
import '../../../../../generated/l10n.dart';
import '../../view_model/post_appointment/post_appointment_cubit.dart';

class CustomTimePick extends StatefulWidget {
  const CustomTimePick({
    super.key,
  });

  @override
  State<CustomTimePick> createState() => _CustomTimePickState();
}

class _CustomTimePickState extends State<CustomTimePick> {
  String startTime = '00:00';
  String endTime = '00:00';
  @override
  Widget build(BuildContext context) {
    getTimeFromUser({required bool isStartTime}) async {
      TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: isStartTime
            ? TimeOfDay.fromDateTime(DateTime.now())
            : TimeOfDay.fromDateTime(
                DateTime.now().add(const Duration(minutes: 15))),
      );

      if (pickedTime != null) {
        setState(() {
          String formatted = pickedTime.format(context);

          if (isStartTime) {
            startTime = formatted;
            context
                .read<PostAppointmentCubit>()
                .setStartTime(context, pickedTime);
          } else {
            endTime = formatted;
            context
                .read<PostAppointmentCubit>()
                .setEndTime(context, pickedTime);
          }
        });
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
                      controller: context
                          .read<PostAppointmentCubit>()
                          .startTimeController,
                      hintTxt: startTime,
                      initialVal: context
                          .read<PostAppointmentCubit>()
                          .startTimeController
                          .text,
                      suffixIcon: IconButton(
                        onPressed: () => getTimeFromUser(isStartTime: true),
                        icon: SvgPicture.asset(
                          AppIcons.iconTime,
                          colorFilter: ColorFilter.mode(
                              Theme.of(context).brightness == Brightness.light
                                  ? AppColors.black.withValues(alpha: 0.7)
                                  : AppColors.white.withValues(alpha: 0.7),
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
                      controller: context
                          .read<PostAppointmentCubit>()
                          .endTimeController,
                      hintTxt: endTime,
                      initialVal: context
                          .read<PostAppointmentCubit>()
                          .endTimeController
                          .text,
                      suffixIcon: IconButton(
                        onPressed: () => getTimeFromUser(isStartTime: false),
                        icon: SvgPicture.asset(
                          AppIcons.iconTime,
                          colorFilter: ColorFilter.mode(
                              Theme.of(context).brightness == Brightness.light
                                  ? AppColors.black.withValues(alpha: .7)
                                  : AppColors.white.withValues(alpha: 0.7),
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
