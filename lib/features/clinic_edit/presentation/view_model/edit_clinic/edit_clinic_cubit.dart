import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:doctor_app/core/database/api/api_error_handler.dart';
import 'package:doctor_app/core/database/api/api_error_model.dart';
import 'package:doctor_app/core/database/cache/cache_keys.dart';
import 'package:doctor_app/features/clinic_edit/data/repo/edit_clinic_repo.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import '../../../../../core/database/cache/secure_storage.dart';
import '../../../data/models/edit_clinic_model.dart';
part 'edit_clinic_state.dart';

class EditClinicCubit extends Cubit<EditClinicState> {
  EditClinicCubit(this.clinicEditRepo) : super(EditClinicInitial());
  final TextEditingController clinicNameController = TextEditingController();
  final TextEditingController clinicStatusController = TextEditingController();
  final TextEditingController specializationNameController =
      TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController aboutDoctorController = TextEditingController();
  final TextEditingController latitudeController = TextEditingController();
  final TextEditingController longitudeController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final EditClinicRepo clinicEditRepo;

  void editClinic() async {
    final String? clinicId = await SecureStorage.instance.getData(key: CacheKeys.id);
    log(clinicId?? "===========no clinic id============");
    final EditClinicModel editClinicModel = EditClinicModel(
        id: clinicId!,
        name: clinicNameController.text,
        price: double.parse(priceController.text).toInt(),
        long: double.parse(longitudeController.text),
        lat: double.parse(latitudeController.text),
        specialization: specializationNameController.text);
    emit(EditClinicLoading());
    try {
      final result = await clinicEditRepo.editClinic(editClinicModel);
      result.fold((message) => emit(EditClinicFailure(message: message)),
          (_) => emit(EditClinicSuccess()));
    } catch (e) {
      emit(EditClinicFailure(message: ApiErrorHandler.handleError(e)));
    }
  }

  @override
  Future<void> close() {
    clinicNameController;
    clinicStatusController;
    specializationNameController.dispose();
    priceController.dispose();
    aboutDoctorController.dispose();
    latitudeController.dispose();
    longitudeController.dispose();
    return super.close();
  }
}
