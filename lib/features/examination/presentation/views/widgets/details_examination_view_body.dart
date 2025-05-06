import 'package:doctor_app/core/helpers/extentions.dart';
import 'package:doctor_app/core/utils/app_colors.dart';
import 'package:doctor_app/core/utils/app_icons.dart';
import 'package:doctor_app/core/utils/app_images.dart';
import 'package:doctor_app/core/utils/app_styles.dart';
import 'package:doctor_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class DetailsExaminationViewBody extends StatelessWidget {
  const DetailsExaminationViewBody({super.key});

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
                        '{} 4, 2024',
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
                  PrescriptionList(),
                ],
              ),
            ),
          ),
          Gap(50.h),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24.0,
            ),
            child: DiagonsisWidget(),
          ),
          Gap(50.h),
          NextAppoinmentSection(),
        ],
      ),
    );
  }
}

class NextAppoinmentSection extends StatelessWidget {
  const NextAppoinmentSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          S.of(context).nextAppointment,
          style: AppStyles.semiBold20(context).copyWith(
            color: AppColors.primaryColor,
          ),
        ),
        Gap(5.h),
        Text(
          'Next appointment date',
          style: AppStyles.semiBold12(context).copyWith(
            color: Theme.of(context).brightness == Brightness.light
                ? AppColors.black.withOpacity(0.4)
                : AppColors.white.withOpacity(0.4),
          ),
        ),
      ],
    );
  }
}

class DiagonsisWidget extends StatelessWidget {
  const DiagonsisWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.primaryColor.withOpacity(0.6),
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 30.w,
          vertical: 20.h,
        ),
        child: Column(children: [
          Row(
            children: [
              Image.asset(
                AppImages.imagesMissedAppointment,
                height: 35.h,
              ),
              Gap(10.w),
              Text(
                S.of(context).diagnosis,
                style: AppStyles.semiBold18(context),
              ),
            ],
          ),
          Gap(15.h),
          Row(
            children: [
              SizedBox(
                width: 30.w,
              ),
              Expanded(
                child: Text(
                  'kndklvndklvndklsvnjkdnvkjdvsdkvbklsbnvkjdbvkljsvklsavlfvjfbvjkfndvknskjvkjsdbvjksdbvksjdbvkjsdbvksbk',
                  textAlign: TextAlign.center,
                  style: AppStyles.semiBold12(context).copyWith(
                    color: Theme.of(context).brightness == Brightness.light
                        ? AppColors.black.withOpacity(0.5)
                        : AppColors.white.withOpacity(0.5),
                  ),
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}

class PrescriptionItem extends StatelessWidget {
  const PrescriptionItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Medicine Name x 2',
          style: AppStyles.semiBold15(context),
        ),
        Gap(5.h),
        Text(
          'Dosage: 2 times daily',
          style: AppStyles.semiBold12(context).copyWith(
            color: Theme.of(context).brightness == Brightness.light
                ? AppColors.black.withOpacity(0.4)
                : AppColors.white.withOpacity(0.4),
          ),
        ),
      ],
    );
  }
}

class PrescriptionList extends StatelessWidget {
  const PrescriptionList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 2,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20),
            child: PrescriptionItem(),
          );
        });
  }
}

class DetailsExaminationHeader extends StatelessWidget {
  const DetailsExaminationHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.35,
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(
            150.r,
          ),
        ),
      ),
      child: Column(
        children: [
          Gap(15.h),
          Row(
            children: [
              IconButton(
                onPressed: () {
                  context.pop();
                },
                icon: SvgPicture.asset(
                  AppIcons.svgsAuthBackIcon,
                ),
              ),
              Text(
                S.of(context).prescription,
                style: AppStyles.medium15(context).copyWith(
                  color: Theme.of(context).brightness == Brightness.light
                      ? AppColors.white
                      : AppColors.black,
                ),
              ),
            ],
          ),
          Gap(35.h),
          CircleAvatar(
            radius: 40.r,
            backgroundColor: Colors.red,
            backgroundImage: AssetImage(AppImages.imagesAvatar),
          ),
          Gap(15.h),
          Text(
            'Khaled Gamal',
            style: AppStyles.semiBold30(context).copyWith(
              color: Theme.of(context).brightness == Brightness.light
                  ? AppColors.white
                  : AppColors.black,
            ),
          )
        ],
      ),
    );
  }
}
