import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../generated/l10n.dart';

class DeleteButton extends StatelessWidget {
  const DeleteButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120.w,
      height: 36.h,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: const WidgetStatePropertyAll(AppColors.red),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              actionsAlignment: MainAxisAlignment.center,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(S.of(context).delete),
                  SizedBox(width: 10.h),
                  Icon(Icons.priority_high, color: AppColors.red, size: 30.sp),
                ],
              ),
              content: Text(
                S.of(context).wantToDeleteClinic,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              actions: [
                TextButton(
                  style: const ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(AppColors.red),
                  ),
                  onPressed: () {
                    //TODO
                    Navigator.pop(context);
                  },
                  child: Text(S.of(context).yes,
                      style: const TextStyle(color: Colors.white)),
                ),
                SizedBox(width: 20.w),
                TextButton(
                  style: const ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(AppColors.gray),
                  ),
                  onPressed: () => Navigator.pop(context),
                  child: Text(S.of(context).no,
                      style: const TextStyle(color: Colors.black)),
                ),
              ],
            ),
          );
        },
        child: Text(
          S.of(context).delete,
          style: Theme.of(context)
              .textTheme
              .displayMedium!
              .copyWith(fontSize: 18, color: AppColors.white),
        ),
      ),
    );
  }
}
