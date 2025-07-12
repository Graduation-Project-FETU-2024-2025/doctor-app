import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/global_cubits/appointment_action_cubit/appointment_action_cubit.dart';
import '../../../../../core/global_cubits/appointment_action_cubit/appointment_action_state.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_icons.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../../../core/widgets/toast.dart';
import '../../../../../generated/l10n.dart';

class RequiredAnalysisContainer extends StatelessWidget {
  final String? fileUrl;

  const RequiredAnalysisContainer({super.key, required this.fileUrl});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppointmentActionCubit, AppointmentActionState>(
      listener: (context, state) {
        if (state is FileDownloadError) {
          errorToast(message: state.message);
        } else if (state is FileDownloadSuccess) {
          successToast(message: S.of(context).fileDownloadSuccessfully);
        }
      },
      builder: (context, state) {
        return Container(
          alignment: Alignment.center,
          height: 60.h,
          width: 255.w,
          decoration: BoxDecoration(
            color: AppColors.primaryColor.withAlpha(50),
            borderRadius: BorderRadius.circular(7),
          ),
          child: Padding(
            padding: const EdgeInsets.all(13.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    if (fileUrl == null || fileUrl!.isEmpty) {
                      errorToast(message: S.of(context).noDownloadLink);
                      return;
                    }

                    context
                        .read<AppointmentActionCubit>()
                        .downloadAndOpenFile(url: fileUrl!);
                  },
                  child: SvgPicture.asset(AppIcons.svgsIconAttachment),
                ),
                SizedBox(width: 12.w),
                Text(
                  S.of(context).requiredAnalysis,
                  style: AppStyles.semiBold15(context),
                ),
                const Spacer(),
                if (state is FileDownloadLoading)
                  SizedBox(
                    width: 20.w,
                    height: 20.h,
                    child: const CircularProgressIndicator(strokeWidth: 2),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
