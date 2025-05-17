import 'package:doctor_app/core/utils/app_colors.dart';
import 'package:doctor_app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class DosageWidget extends StatelessWidget {
  final int dosage;
  final bool isEnabled;
  final void Function(int) onChanged;

  const DosageWidget({
    super.key,
    required this.dosage,
    required this.onChanged,
    required this.isEnabled,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.zero,
      height: 30,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: AppColors.white,
        border: Border.all(
          color: AppColors.gray,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          children: [
            GestureDetector(
              onTap: isEnabled ? () => onChanged(dosage + 1) : null,
              child: Icon(
                Icons.add,
                size: 12,
                color: isEnabled
                    ? AppColors.black
                    : AppColors.black.withOpacity(0.3),
              ),
            ),
            const SizedBox(width: 8),
            Text(
              '$dosage',
              style: AppStyles.semiBold10(context).copyWith(
                color: isEnabled
                    ? AppColors.black
                    : AppColors.black.withOpacity(0.3),
              ),
            ),
            const SizedBox(width: 8),
            GestureDetector(
              onTap:
                  isEnabled && dosage > 1 ? () => onChanged(dosage - 1) : null,
              child: Icon(
                Icons.remove,
                size: 12,
                color: isEnabled
                    ? AppColors.black
                    : AppColors.black.withOpacity(0.3),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
