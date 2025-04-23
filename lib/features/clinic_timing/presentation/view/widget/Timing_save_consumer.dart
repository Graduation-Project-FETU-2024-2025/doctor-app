import 'package:doctor_app/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../generated/l10n.dart';

class TimingSaveConsumer extends StatelessWidget {
  const TimingSaveConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 120.w,
        height: 36.h,
        child: CustomButton(
          onPressed: () {},
          text: S.of(context).save,
        ),
      ),
    );
  }
}
