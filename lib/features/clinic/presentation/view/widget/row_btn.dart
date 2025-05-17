import 'package:doctor_app/core/helpers/extentions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import '../../../../../core/routers/routing.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_icons.dart';
import '../../../data/models/clinic_model.dart';
import '../../view_model/clinic_cubit/clinic_cubit.dart';
import 'delete_button.dart';

class RowBtn extends StatelessWidget {
  const RowBtn({super.key, required this.clinicModel});
  final ClinicModel clinicModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        DeleteButton(),
        Gap(35.w),
        SizedBox(
          width: 40.w,
          height: 40.h,
          child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor:
                    const WidgetStatePropertyAll(AppColors.primaryColor),
                shape: WidgetStatePropertyAll(
                  const CircleBorder(),
                ),
                padding: const WidgetStatePropertyAll(
                  EdgeInsets.all(10),
                ),
              ),
              onPressed: () async {
                final result = await context.pushNamed(Routing.clinicEdit, argument: clinicModel);
                if (result !=null) {
                  context.read<ClinicCubit>().fetchClinicDetails();
                }
              },
              child: SvgPicture.asset(
                AppIcons.svgsEditIcon,
                colorFilter: ColorFilter.mode(Colors.white, BlendMode.dst),
              )),
        ),
      ],
    );
  }
}
