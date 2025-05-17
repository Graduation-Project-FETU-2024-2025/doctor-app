import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ErrorApiWidget extends StatelessWidget {
  const ErrorApiWidget({
    super.key,
    required this.message,
  });
  final String message;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          message,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        SizedBox(width: 10.w),
        const Icon(Icons.error),
      ],
    );
  }
}
