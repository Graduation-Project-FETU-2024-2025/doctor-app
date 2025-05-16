import 'package:bloc/bloc.dart';
import 'package:doctor_app/features/clinic/data/models/clinic_model.dart';
import 'package:meta/meta.dart';

import '../../../../../core/database/api/api_error_model.dart';
import '../../../data/repo/clinic_repo.dart';

part 'clinic_state.dart';

class ClinicCubit extends Cubit<ClinicState> {
  ClinicCubit({required this.clinicRepo}) : super(ClinicInitial());
  final ClinicRepo clinicRepo;

  void fetchClinicDetails() async {
    emit(ClinicLoading());
    final result = await clinicRepo.fetchClinicDetails();
    result.fold(
      (message) => emit(ClinicFailure(message: message)),
      (clinicData) => emit(ClinicSuccess(clinicData: clinicData)),
    );
  }
}
