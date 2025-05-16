import 'package:doctor_app/core/utils/app_colors.dart';
import 'package:doctor_app/core/widgets/error_api_widget.dart';
import 'package:doctor_app/core/widgets/no_search_result.dart';
import 'package:doctor_app/features/medicines/data/models/system_medicine_model.dart';
import 'package:doctor_app/features/medicines/presentation/view_models/system_medicine_cubit/system_medicine_cubit.dart';
import 'package:doctor_app/features/medicines/presentation/views/widgets/medicine_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

class MedicineGrid extends StatelessWidget {
  const MedicineGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SystemMedicineCubit, SystemMedicineState>(
      builder: (context, state) {
        if (state is SystemMedicinesSuccess) {
          if (state.systemMedicines.isEmpty) {
            return NoSearchResult();
          }
          return GridView.builder(
            itemCount: state.systemMedicines.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 20.w,
              mainAxisSpacing: 20.h,
              childAspectRatio: 157 / 180,
            ),
            itemBuilder: (context, index) => MedicineCard(
              medicineModel: state.systemMedicines[index],
            ),
          );
        } else if (state is SystemMedicinesFailure) {
          return Center(
            child: ErrorApiWidget(message: state.apiErrorModel.message!),
          );
        } else {
          return Skeletonizer(
            effect: ShimmerEffect(
              baseColor: Theme.of(context).brightness == Brightness.dark
                  ? AppColors.darkGray
                  : AppColors.lightGray,
            ),
            enabled: true,
            child: GridView.builder(
              itemCount: 4,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 20.w,
                mainAxisSpacing: 20.h,
                childAspectRatio: 157 / 180,
              ),
              itemBuilder: (context, index) => MedicineCard(
                medicineModel: SystemMedicineModel(
                  code: '',
                  name: 'cjcn',
                  image:
                      "https://dkud4u09qff41.cloudfront.net/Products/ac84b8ac-e0e8-45e8-827f-7c7a3b0c5aca.jpeg",
                  type: '',
                  activePrincipal: 'jcjhcdjc',
                  companyName: 'cnasc ',
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
