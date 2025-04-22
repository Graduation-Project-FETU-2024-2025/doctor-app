import 'package:doctor_app/features/clinic_detail/presentation/view/widget/clinic_detail_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'booking_price_card.dart';
import 'row_btn.dart';

class ClinicDetailViewBody extends StatelessWidget {
  const ClinicDetailViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Column(
        children: [
          const ClinicDetailInfo(),
          Gap(50.h),
          BookingPriceCard(),
          Gap(50.h),
          RowBtn()
        ],
      ),
    );
  }
}
