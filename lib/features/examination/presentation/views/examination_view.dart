import 'package:doctor_app/features/examination/presentation/views/widgets/examination_view_body.dart';
import 'package:flutter/material.dart';

class ExaminationView extends StatelessWidget {
  const ExaminationView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: ExaminationViewBody(),
      ),
    );
  }
}
