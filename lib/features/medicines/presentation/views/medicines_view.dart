import 'package:doctor_app/features/medicines/presentation/views/widgets/medicines_view_body.dart';
import 'package:flutter/material.dart';

class MedicinesView extends StatelessWidget {
  const MedicinesView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: MedicinesViewBody(),
      ),
    );
  }
}
