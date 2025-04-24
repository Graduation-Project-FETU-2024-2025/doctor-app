// import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
// import 'package:geolocator/geolocator.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../../../core/widgets/custom_edit_text_form_field.dart';
import '../../../../../generated/l10n.dart';

class GetLatAndLong extends StatefulWidget {
  const GetLatAndLong({super.key, this.lat, this.long});
  final String? lat;
  final String? long;

  @override
  State<GetLatAndLong> createState() => _GetLatAndLongState();
}

class _GetLatAndLongState extends State<GetLatAndLong> {
  // Future<void> getCurrentLocation() async {
  //   bool serviceEnabled;
  //   LocationPermission permission;

  //   serviceEnabled = await Geolocator.isLocationServiceEnabled();
  //   if (!serviceEnabled) {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(content: Text(S.of(context).enableLocationService)),
  //     );
  //     return;
  //   }

  //   permission = await Geolocator.checkPermission();
  //   if (permission == LocationPermission.denied) {
  //     permission = await Geolocator.requestPermission();
  //     if (permission == LocationPermission.denied) {
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(content: Text(S.of(context).locationPermissionDenied)),
  //       );
  //       return;
  //     }
  //   }

  //   if (permission == LocationPermission.deniedForever) {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(content: Text(S.of(context).locationPermanentlyDenied)),
  //     );
  //     return;
  //   }

  //   Position position = await Geolocator.getCurrentPosition(
  //     desiredAccuracy: LocationAccuracy.high,
  //   );

  //   setState(() {
  //     log(position.longitude.toString());
  //     // Cubit.get(context).latitudeController.text =
  //     //     position.latitude.toString();
  //     // Cubit.get(context).longitudeController.text =
  //     //     position.longitude.toString();
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 100,
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      S.of(context).latitude,
                      style: AppStyles.semiBold14(context),
                    ),
                    Gap(18.h),
                    CustomEditTextFormField(
                      controller: TextEditingController(),
                      // Cubit.get(context).latitudeController,
                      hintTxt: widget.lat ?? "00.000",
                      keyboardType: TextInputType.number,
                      initialVal: widget.lat,
                      readOnly: true,
                    ),
                  ],
                ),
              ),
              Gap(19.h),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      S.of(context).longitude,
                      style: AppStyles.semiBold14(context),
                    ),
                    Gap(18.h),
                    CustomEditTextFormField(
                      controller: TextEditingController(),
                      // Cubit.get(context).longitudeController,
                      hintTxt: widget.long ?? "00.000",
                      keyboardType: TextInputType.number,
                      initialVal: widget.long,
                      readOnly: true,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Gap(31.h),
        SizedBox(
          // width: 214.w,
          height: 36.h,
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(
                  AppColors.primaryColor.withOpacity(0.7)),
              shape: WidgetStatePropertyAll(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            onPressed: () {}, //getCurrentLocation,
            child: Text(
              S.of(context).getAddressInfo,
              style: Theme.of(context)
                  .textTheme
                  .displayMedium!
                  .copyWith(fontSize: 18, color: AppColors.white),
            ),
          ),
        ),
        Gap(31.h),
      ],
    );
  }
}
