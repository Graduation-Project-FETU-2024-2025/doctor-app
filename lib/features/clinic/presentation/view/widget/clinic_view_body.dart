import 'package:doctor_app/features/clinic/data/models/clinic_model.dart';
import 'package:doctor_app/features/clinic/presentation/view/widget/clinic_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../../../generated/l10n.dart';
import 'about_the_doctor.dart';
import 'booking_price_card.dart';
import 'row_btn.dart';

class ClinicViewBody extends StatelessWidget {
  const ClinicViewBody({super.key, required this.clinicModel});
  final ClinicModel clinicModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClinicInfo(
            startTime:
                clinicModel.appointmentDates[0].workingPeriods[0].startTime,
            endTime: clinicModel.appointmentDates[0].workingPeriods[0].endTime,
            clinicAddress: clinicModel.address,
            clinicPhone: clinicModel.clinicPhones.isNotEmpty
                ? "${clinicModel.clinicPhones[0]} - ${clinicModel.clinicPhones[1]}"
                : '',
            reviews: clinicModel.reviews,
          ),
          Gap(50.h),
          AboutTheDoctor(
            about: clinicModel.about,
          ),
          Gap(30.h),
          Text(
            S.of(context).bookingPrice,
            style: AppStyles.semiBold15(context),
          ),
          Gap(13.h),
          BookingPriceCard(
            reviews: clinicModel.reviews,
            price: clinicModel.price.toString(),
            specialization: clinicModel.specialization,
          ),
          Gap(50.h),
          RowBtn(
            clinicModel: clinicModel,
          )
        ],
      ),
    );
  }
}
