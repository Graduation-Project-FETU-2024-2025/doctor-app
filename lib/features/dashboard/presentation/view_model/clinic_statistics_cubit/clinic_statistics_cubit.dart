

import 'package:doctor_app/features/dashboard/data/repository/clinic_statistic_repo.dart';
import 'package:doctor_app/features/dashboard/presentation/view_model/clinic_statistics_cubit/clinic_statistics_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ClinicStatisticsCubit extends Cubit<ClinicStatisticsState> {
  ClinicStatisticsCubit(this._clinicStatisticRepo) : super(ClinicStatisticsInitial());
  final ClinicStatisticRepo _clinicStatisticRepo;


  void getClinicStatistics() async {
    emit(ClinicStatisticsLoading());
    final result = await _clinicStatisticRepo.getClinicStatistics();
    result.fold(
      (error) => emit(ClinicStatisticsError(error)),
      (data) => emit(ClinicStatisticsLoaded(data)),
    );
  }
}
