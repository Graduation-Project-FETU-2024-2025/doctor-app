import 'package:doctor_app/core/utils/app_colors.dart';
import 'package:flutter/widgets.dart';

class CustomRadioButton extends StatelessWidget {
  const CustomRadioButton({super.key, required this.isSelected});
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: 25,
      height: 25,
      decoration: isSelected
          ? const BoxDecoration(
              color: AppColors.primaryColor,
              shape: BoxShape.circle,
            )
          : BoxDecoration(
              border: Border.all(
                color: AppColors.black.withOpacity(.3),
                width: 2,
              ),
              shape: BoxShape.circle,
            ),
      child: isSelected
          ? Container(
              margin: const EdgeInsets.all(5),
              decoration: const BoxDecoration(
                color: AppColors.white,
                shape: BoxShape.circle,
              ),
            )
          : const SizedBox(),
    );
  }
}
