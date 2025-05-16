import 'package:doctor_app/core/routers/routing.dart';
import 'package:doctor_app/core/utils/app_colors.dart';
import 'package:doctor_app/core/utils/app_styles.dart';
import 'package:doctor_app/core/widgets/add_delete_button.dart';
import 'package:doctor_app/core/widgets/toast.dart';
import 'package:doctor_app/features/examination/data/models/examination_model.dart';
import 'package:doctor_app/features/examination/presentation/view_models/examination_cubit/examination_cubit.dart';
import 'package:doctor_app/features/examination/presentation/views/widgets/details_examination_header.dart';
import 'package:doctor_app/features/examination/presentation/views/widgets/diagonsis_widget.dart';
import 'package:doctor_app/features/examination/presentation/views/widgets/next_appointment_section.dart';
import 'package:doctor_app/features/examination/presentation/views/widgets/prescription_list.dart';
import 'package:doctor_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class DetailsExaminationViewBody extends StatelessWidget {
  const DetailsExaminationViewBody({super.key, required this.examinationModel});
  final ExaminationModel examinationModel;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          DetailsExaminationHeader(),
          Gap(50.h),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 24.w,
            ),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.r),
                border: Border.all(
                  color: Theme.of(context).brightness == Brightness.light
                      ? AppColors.black.withOpacity(0.3)
                      : AppColors.white.withOpacity(0.3),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 10),
                    child: Chip(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.r),
                        side: BorderSide(
                          width: 0.0,
                          color:
                              Theme.of(context).brightness == Brightness.light
                                  ? AppColors.black.withOpacity(0.2)
                                  : AppColors.white.withOpacity(0.2),
                        ),
                      ),
                      label: Text(
                        '${examinationModel.createdAt.day} / ${examinationModel.createdAt.month} / ${examinationModel.createdAt.year}',
                        style: AppStyles.medium15(context),
                      ),
                      backgroundColor:
                          Theme.of(context).brightness == Brightness.light
                              ? AppColors.black.withOpacity(0.2)
                              : AppColors.white.withOpacity(0.2),
                      labelStyle: TextStyle(color: AppColors.primaryColor),
                    ),
                  ),
                  Divider(
                    color: Theme.of(context).brightness == Brightness.light
                        ? AppColors.black.withOpacity(0.3)
                        : AppColors.white.withOpacity(0.3),
                    height: 1.h,
                  ),
                  PrescriptionList(
                    prescriptions: examinationModel.medicines,
                  ),
                ],
              ),
            ),
          ),
          Gap(50.h),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24.0,
            ),
            child: DiagonsisWidget(
              diagonsis: examinationModel.diagonsis,
            ),
          ),
          Gap(50.h),
          NextAppoinmentSection(
            nextAppoinment: examinationModel.nextAppointment,
          ),
          Gap(50.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocConsumer<ExaminationCubit, ExaminationState>(
                listener: (context, state) {
                  if (state is ExaminationSucess) {
                    successToast(
                      message: state.successMessage,
                    );
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      Routing.home,
                      (r) => false,
                    );
                  }
                  if (state is ExaminationFailure) {
                    errorToast(
                      message: state.errorModel.message!,
                    );
                  }
                },
                builder: (context, state) {
                  return state is ExaminationLoading
                      ? CircularProgressIndicator(
                          color: AppColors.primaryColor,
                        )
                      : SizedBox(
                          height: 36.h,
                          width: 120.w,
                          child: AddDeleteButton(
                            title: S.of(context).submit,
                            color: AppColors.primaryColor,
                            onpressed: () {
                              final cubit = ExaminationCubit.get(context);
                              cubit.updateModelData();
                              cubit.sendPrescription();
                            },
                          ),
                        );
                },
              ),
            ],
          ),
          Gap(50.h),
        ],
      ),
    );
  }
}
