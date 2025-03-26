import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class AddDeleteButton extends StatelessWidget {
  const AddDeleteButton(
      {super.key,
      required this.title,
      required this.color,
      required this.onpressed});
  final String title;
  final Color color;
  final void Function() onpressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(color),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
      onPressed: onpressed,
      child: Text(
        title,
        style: Theme.of(context)
            .textTheme
            .displayMedium!
            .copyWith(fontSize: 18, color: AppColors.white),
      ),
    );
  }
}
