import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../../../generated/l10n.dart';

class OpeningStatusRow extends StatelessWidget {
  final String startTimeStr;
  final String endTimeStr;

  const OpeningStatusRow({
    super.key,
    required this.startTimeStr,
    required this.endTimeStr,
  });

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();

    final DateTime startTime = DateFormat("HH:mm:ss").parse(startTimeStr);
    final DateTime endTime = DateFormat("HH:mm:ss").parse(endTimeStr);

    DateTime todayStart = DateTime(
        now.year, now.month, now.day, startTime.hour, startTime.minute);
    DateTime todayEnd =
        DateTime(now.year, now.month, now.day, endTime.hour, endTime.minute);

    if (todayEnd.isBefore(todayStart)) {
      todayEnd = todayEnd.add(const Duration(days: 1));
    }

    final bool isOpen = now.isAfter(todayStart) && now.isBefore(todayEnd);

    return Row(
      children: [
        Text(
          isOpen ? S.of(context).open : S.of(context).close,
          style: AppStyles.semiBold15(context).copyWith(
            color: isOpen ? AppColors.green : Colors.red,
          ),
          overflow: TextOverflow.ellipsis,
        ),
        Text(
          isOpen ? " .${S.of(context).close} " : " .${S.of(context).open} ",
          style: AppStyles.semiBold15(context).copyWith(
            color: Theme.of(context).brightness == Brightness.dark
                ? Colors.white60
                : Colors.black38,
          ),
          overflow: TextOverflow.ellipsis,
        ),
        Text(
          DateFormat.jm().format(todayEnd),
          style: AppStyles.semiBold15(context).copyWith(
            color: Theme.of(context).brightness == Brightness.dark
                ? Colors.white60
                : Colors.black38,
          ),
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
