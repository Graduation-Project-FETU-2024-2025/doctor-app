import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../../../generated/l10n.dart';
import '../../view_model/post_appointment/post_appointment_cubit.dart';
import 'custom_tme_dialog.dart';

class SetUserTime extends StatelessWidget {
  const SetUserTime({super.key});

  void _openDialog(BuildContext ctx) {
    showGeneralDialog(
      context: ctx,
      barrierLabel: S.of(ctx).setAnotherTime,
      barrierDismissible: true,
      barrierColor: Colors.black.withValues(alpha: 0.4),
      transitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (_, __, ___) => const SizedBox.shrink(),
      transitionBuilder: (context, anim1, anim2, child) {
        return BlocProvider.value(
          value: ctx.read<PostAppointmentCubit>(),
          child: Transform.scale(
            scale: Curves.easeOutBack.transform(anim1.value),
            child: Opacity(
              opacity: anim1.value,
              child: const CustomTimeDialog(),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(S.of(context).startTime,
            style: AppStyles.semiBold15(context)
                .copyWith(color: AppColors.black.withValues(alpha: 0.3))),
        const Spacer(),
        SizedBox(
          width: 83.w,
          height: 26.h,
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: const WidgetStatePropertyAll(AppColors.black),
              shape: WidgetStatePropertyAll(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
            ),
            onPressed: () => _openDialog(context),
            child: Text(
              '${S.of(context).add} +',
              style: AppStyles.semiBold15(context).copyWith(
                  fontSize: 10,
                  color: AppColors.white,
                  decoration: TextDecoration.underline),
            ),
          ),
        )
      ],
    );
  }
}
