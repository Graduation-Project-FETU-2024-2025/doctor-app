import 'package:doctor_app/features/clinic_detail/presentation/view/widget/clinic_detail_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../../../generated/l10n.dart';
import 'booking_price_card.dart';
import 'row_btn.dart';

class ClinicDetailViewBody extends StatelessWidget {
  const ClinicDetailViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ClinicDetailInfo(),
          Gap(50.h),
          Text(
              S.of(context).bookingPrice,
              style: AppStyles.semiBold15(context),
            ),
          Gap(11.h),
          BookingPriceCard(),
          Gap(50.h),
          RowBtn()
        ],
      ),
    );
  }
}
