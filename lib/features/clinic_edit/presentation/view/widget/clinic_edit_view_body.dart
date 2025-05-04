import 'package:flutter/material.dart';

import 'edit_clinic_info.dart';
import 'edit_save_consumer.dart';
import 'get_lat_and_long.dart';

class ClinicEditViewBody extends StatelessWidget {
  const ClinicEditViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        EditClinicInfo(),
        GetLatAndLong(),
        EditSaveConsumer(),
      ],
    );
  }
}
