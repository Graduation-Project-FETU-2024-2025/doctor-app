import 'package:doctor_app/features/examination/data/models/examination_model.dart';
import 'package:doctor_app/features/examination/presentation/views/widgets/details_examination_view_body.dart';
import 'package:flutter/material.dart';

class DetailsExaminationView extends StatelessWidget {
  const DetailsExaminationView({super.key, required this.examinationModel});
  final ExaminationModel examinationModel;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: DetailsExaminationViewBody(),
      ),
    );
  }
}
