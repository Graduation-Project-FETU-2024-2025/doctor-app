import 'package:doctor_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomCheckbox extends StatefulWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  const CustomCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  State<CustomCheckbox> createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  late bool isChecked;

  @override
  void initState() {
    super.initState();
    isChecked = widget.value;
  }

  void _toggleCheckbox() {
    setState(() {
      isChecked = !isChecked;
    });
    widget.onChanged(isChecked);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggleCheckbox,
      child: Container(
        width: 18,
        height: 18,
        decoration: BoxDecoration(
          color: AppColors.white,
          border: Border.all(
            color: AppColors.primaryColor,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(5),
        ),
        child: isChecked
            ? Icon(
                Icons.check,
                size: 16,
                color: AppColors.primaryColor,
              )
            : null,
      ),
    );
  }
}
