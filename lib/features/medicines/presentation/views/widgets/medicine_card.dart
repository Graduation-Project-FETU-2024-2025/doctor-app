import 'package:cached_network_image/cached_network_image.dart';
import 'package:doctor_app/core/utils/app_colors.dart';
import 'package:doctor_app/core/utils/app_styles.dart';
import 'package:doctor_app/features/examination/data/models/prescription_medicine_model.dart';
import 'package:doctor_app/features/examination/presentation/view_models/examination_cubit/examination_cubit.dart';
import 'package:doctor_app/features/medicines/data/models/system_medicine_model.dart';
import 'package:doctor_app/features/medicines/presentation/views/widgets/custom_check_box.dart';
import 'package:doctor_app/features/medicines/presentation/views/widgets/dosage_widget.dart';
import 'package:doctor_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

class MedicineCard extends StatefulWidget {
  const MedicineCard({
    super.key,
    required this.medicineModel,
  });
  final SystemMedicineModel medicineModel;
  @override
  State<MedicineCard> createState() => _MedicineCardState();
}

class _MedicineCardState extends State<MedicineCard> {
  int dosage = 1;
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    final cubit = ExaminationCubit.get(context);
    PrescriptionMedicineModel medicine = PrescriptionMedicineModel(
        id: widget.medicineModel.code,
        name: widget.medicineModel.name,
        dosage: 1,
        instructions: '');
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Theme.of(context).brightness == Brightness.light
                ? AppColors.white
                : AppColors.darkWhite,
            border: Border.all(
              color: const Color(0xffB3B3B3),
            ),
          ),
          child: Column(
            children: [
              Expanded(
                flex: 3,
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                    image: DecorationImage(
                      image: CachedNetworkImageProvider(
                          widget.medicineModel.image),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 5.h),
              Expanded(
                flex: 2,
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.w,
                    ),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.medicineModel.name,
                                  style: AppStyles.semiBold14(context),
                                ),
                                SizedBox(height: 5.h),
                                Text(
                                  widget.medicineModel.activePrincipal,
                                  style: AppStyles.semiBold10(context),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                  ),
                  child: Row(
                    children: [
                      Text(
                        S.of(context).Dosage,
                        style: AppStyles.semiBold10(context),
                      ),
                      const Spacer(),
                      Skeleton.shade(
                        child: DosageWidget(
                          dosage: dosage,
                          isEnabled: isChecked,
                          onChanged: (value) {
                            setState(() {
                              dosage = value;
                              medicine.updateDosage(value);
                              cubit.updateMedicine(
                                medicineId: medicine.id,
                                dosage: dosage,
                              );
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 8.h),
            ],
          ),
        ),
        PositionedDirectional(
          top: 8,
          end: 10,
          child: Skeleton.shade(
            child: CustomCheckbox(
              onChanged: (bool value) {
                setState(() {
                  isChecked = value;
                });
                if (value) {
                  cubit.addMedicine(medicine);
                } else {
                  cubit.removeMedicine(medicine.id);
                }
              },
              value: isChecked,
            ),
          ),
        ),
        // PositionedDirectional(
        //   top: 8,
        //   start: 8,
        //   child: Container(
        //     decoration: BoxDecoration(
        //       borderRadius: BorderRadius.circular(10),
        //       color: Theme.of(context).brightness == Brightness.light
        //           ? AppColors.white
        //           : AppColors.darkWhite,
        //     ),
        //     child: Padding(
        //       padding: const EdgeInsets.all(3),
        //       child: Text(
        //         '1235',
        //         style: AppStyles.semiBold10(context),
        //       ),
        //     ),
        //   ),
        // )
      ],
    );
  }
}
