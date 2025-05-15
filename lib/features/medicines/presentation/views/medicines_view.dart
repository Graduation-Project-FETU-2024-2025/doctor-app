import 'package:doctor_app/core/services/get_it.dart';
import 'package:doctor_app/features/medicines/data/repos/get_system_medicine_repo.dart';
import 'package:doctor_app/features/medicines/presentation/view_models/system_medicine_cubit/system_medicine_cubit.dart';
import 'package:doctor_app/features/medicines/presentation/views/widgets/medicines_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MedicinesView extends StatelessWidget {
  const MedicinesView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocProvider(
          create: (context) =>
              SystemMedicineCubit(getIt<GetSystemMedicinesRepo>())
                ..getSystemMedicines(),
          child: MedicinesViewBody(),
        ),
      ),
    );
  }
}
