import 'package:bloc/bloc.dart';
import 'package:doctor_app/core/database/api/api_error_model.dart';
import 'package:doctor_app/features/medicines/data/models/system_medicine_model.dart';
import 'package:doctor_app/features/medicines/data/repos/get_system_medicine_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'system_medicine_state.dart';

class SystemMedicineCubit extends Cubit<SystemMedicineState> {
  SystemMedicineCubit(this.getSystemMedicinesRepo)
      : super(SystemMedicineInitial());
  static SystemMedicineCubit get(context) => BlocProvider.of(context);
  final TextEditingController searchController = TextEditingController();
  final GetSystemMedicinesRepo getSystemMedicinesRepo;

  void getSystemMedicines() async {
    emit(SystemMedicinesLoading());
    final result = await getSystemMedicinesRepo.getSystemMedicines();
    result.fold(
      (apiErrorModel) => emit(
        SystemMedicinesFailure(apiErrorModel: apiErrorModel),
      ),
      (right) => emit(
        SystemMedicinesSuccess(systemMedicines: right.data),
      ),
    );
  }

  void searchSystemMedicines() async {
    emit(SystemMedicinesLoading());
    final result = await getSystemMedicinesRepo.searchInSystemMedicines(
      query: searchController.text,
    );
    result.fold(
      (apiErrorModel) => emit(
        SystemMedicinesFailure(apiErrorModel: apiErrorModel),
      ),
      (right) => emit(
        SystemMedicinesSuccess(systemMedicines: right.data),
      ),
    );
  }
}
