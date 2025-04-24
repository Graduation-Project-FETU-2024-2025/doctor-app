import 'package:doctor_app/core/utils/app_colors.dart';
import 'package:doctor_app/core/widgets/add_delete_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditSaveConsumer extends StatelessWidget {
  const EditSaveConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: SizedBox(
      width: 120.w,
      height: 36.h,
      child: AddDeleteButton(
        title: 'Save',
        color: AppColors.primaryColor,
        onpressed: () {},
      ),
    ));
  }
}
