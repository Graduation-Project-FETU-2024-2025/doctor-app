import 'package:doctor_app/features/medicines/presentation/views/widgets/medicine_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MedicineGrid extends StatelessWidget {
  const MedicineGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 4,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 20.w,
        mainAxisSpacing: 20.h,
        childAspectRatio: 150 / 157,
      ),
      itemBuilder: (context, index) => MedicineCard(),
    );
  }
}
