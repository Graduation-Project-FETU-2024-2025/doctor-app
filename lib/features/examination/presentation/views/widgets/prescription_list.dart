import 'package:doctor_app/features/examination/data/models/prescription_medicine_model.dart';
import 'package:doctor_app/features/examination/presentation/views/widgets/prescription_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrescriptionList extends StatelessWidget {
  const PrescriptionList({super.key, required this.prescriptions});
  final List<PrescriptionMedicineModel> prescriptions;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: prescriptions.length,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20),
            child: PrescriptionItem(
              model: prescriptions[index],
            ),
          );
        });
  }
}
