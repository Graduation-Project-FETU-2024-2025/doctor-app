part of 'system_medicine_cubit.dart';

@immutable
sealed class SystemMedicineState {}

final class SystemMedicineInitial extends SystemMedicineState {}

final class SystemMedicinesLoading extends SystemMedicineState {}

final class SystemMedicinesSuccess extends SystemMedicineState {
  final List<SystemMedicineModel> systemMedicines;
  SystemMedicinesSuccess({required this.systemMedicines});
}

final class SystemMedicinesFailure extends SystemMedicineState {
  final ApiErrorModel apiErrorModel;
  SystemMedicinesFailure({required this.apiErrorModel});
}
