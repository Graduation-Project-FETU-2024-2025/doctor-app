import 'package:doctor_app/core/utils/app_colors.dart';
import 'package:doctor_app/core/utils/app_images.dart';
import 'package:doctor_app/features/clinic_detail/presentation/view/widget/clinic_detail_view_body.dart';
import 'package:flutter/material.dart';
import '../../../../core/utils/app_styles.dart';
import 'widget/custom_sliver_app_bar.dart';

class ClinicDetailView extends StatelessWidget {
  const ClinicDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          CustomSliverAppBar(
          img: AppImages.imagesClinicDetail,
          isBtnValid: true,
          height: MediaQuery.of(context).size.height * 0.4,
          isLocalImage: true,
                      ),
          SliverToBoxAdapter(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10),
              child: Text('Mayo Clinic',
                  style: AppStyles.semiBold25(context).copyWith(color: AppColors.primaryColor)),
            ),
          ),
          SliverToBoxAdapter(
            child: ClinicDetailViewBody()
            )
        ],
      ),
    );
  }
}
