import 'package:doctor_app/core/helpers/extentions.dart';
import 'package:doctor_app/features/clinic_edit/presentation/view/widget/clinic_edit_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/database/cache/cache_keys.dart';
import '../../../../core/database/cache/cashe_helper.dart';
import '../../../../core/services/get_it.dart';
import '../../../../core/utils/app_icons.dart';
import '../../../clinic/data/models/clinic_model.dart';

class ClinicEditView extends StatelessWidget {
  const ClinicEditView({super.key, required this.clinicModel});
  final ClinicModel clinicModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
            onPressed: () => context.pop(),
            icon: SvgPicture.asset(getIt<CacheHelper>()
                        .getString(key: CacheKeys.currentLanguage) ==
                    'en' ?AppIcons.svgsBack : AppIcons.svgsBackRight)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: SingleChildScrollView(child: ClinicEditViewBody(clinicModel: clinicModel,)),
      ),
    );
  }
}
