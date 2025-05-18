import 'package:doctor_app/core/utils/app_colors.dart';
import 'package:doctor_app/features/dashboard/presentation/view/widgets/workflow_data_coulmn.dart';
import 'package:doctor_app/generated/l10n.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WorkflowChartSection extends StatelessWidget {
  const WorkflowChartSection({super.key});

  @override
  Widget build(BuildContext context) {
    final List<double> values = [
      22,
      43,
      43,
      100,
      100,
      88,
      30,
      120,
      120,
      120,
      50,
      50
    ];
    final List<String> months = [
      'J',
      'F',
      'M',
      'A',
      'M',
      'J',
      'J',
      'A',
      'S',
      'O',
      'N',
      'D'
    ];

    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.light
            ? AppColors.white
            : AppColors.darkWhite,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          const BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 2)),
        ],
      ),
      child: AspectRatio(
        aspectRatio: 330 / 291,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  WorkflowDataColumn(
                    title: S.of(context).checkups,
                    count: '109',
                  ),
                  WorkflowDataColumn(
                    title: S.of(context).newVisits,
                    count: '13',
                  ),
                  WorkflowDataColumn(
                    title: S.of(context).reVisits,
                    count: '5',
                  ),
                ],
              ),
            ),
            Expanded(
              child: BarChart(
                BarChartData(
                  maxY: 140,
                  borderData: FlBorderData(show: false),
                  gridData: const FlGridData(show: false),
                  barTouchData: BarTouchData(enabled: false),
                  titlesData: FlTitlesData(
                    leftTitles:
                        const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    topTitles:
                        const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    rightTitles:
                        const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) {
                          return SideTitleWidget(
                            axisSide: meta.axisSide,
                            child: Text(
                              months[value.toInt()],
                              style: const TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w600,
                                fontSize: 12,
                              ),
                            ),
                          );
                        },
                        reservedSize: 28,
                      ),
                    ),
                  ),
                  barGroups: values.asMap().entries.map((entry) {
                    final index = entry.key;
                    final value = entry.value;
                    return BarChartGroupData(
                      x: index,
                      barRods: [
                        BarChartRodData(
                          toY: value,
                          width: 15,
                          borderRadius: BorderRadius.circular(6),
                          color: Colors.lightBlue,
                        ),
                      ],
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
