import 'package:doctor_app/features/clinic_edit/presentation/view_model/edit_clinic/edit_clinic_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../clinic/data/models/clinic_model.dart';
import 'edit_clinic_info.dart';
import 'edit_save_consumer.dart';
import 'get_lat_and_long.dart';

class ClinicEditViewBody extends StatelessWidget {
  const ClinicEditViewBody({super.key, required this.clinicModel});
  final ClinicModel clinicModel;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<EditClinicCubit>().formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          EditClinicInfo(
            clinicName: clinicModel.name,
            price: clinicModel.price.toString(),
            specializationName: clinicModel.specialization,
          ),
          GetLatAndLong(lat: clinicModel.lat.toString(),long: clinicModel.long.toString(),),
          const EditSaveConsumer(),
        ],
      ),
    );
  }
}
