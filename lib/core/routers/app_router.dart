import 'dart:io';

import 'package:doctor_app/core/routers/routing.dart';
import 'package:doctor_app/core/services/get_it.dart';
import 'package:doctor_app/core/models/patient_appointment_model.dart';
import 'package:doctor_app/features/appointment_details/presentation/view/appointment_details.dart';
import 'package:doctor_app/features/auth/data/repository/auth_repo.dart';
import 'package:doctor_app/features/auth/presentation/view_model/otp_cubit/otp_cubit.dart';
import 'package:doctor_app/features/auth/presentation/view_model/sign_in_cubit/sign_in_cubit.dart';
import 'package:doctor_app/features/auth/presentation/views/otp_view.dart';
import 'package:doctor_app/features/auth/presentation/views/sign_in_view.dart';
import 'package:doctor_app/features/clinic/presentation/view/clinic_view.dart';
import 'package:doctor_app/features/clinic_edit/data/repo/edit_clinic_repo.dart';
import 'package:doctor_app/features/clinic_edit/presentation/view_model/edit_clinic/edit_clinic_cubit.dart';
import 'package:doctor_app/features/edit_profile/data/repo/edit_profile_repo.dart';
import 'package:doctor_app/features/edit_profile/presentation/view/edit_profile_view.dart';
import 'package:doctor_app/features/edit_profile/presentation/view_model/edit_profile_cubit/edit_profile_cubit.dart';
import 'package:doctor_app/features/examination/data/models/examination_model.dart';
import 'package:doctor_app/features/examination/presentation/views/details_examination_view.dart';
import 'package:doctor_app/features/examination/presentation/views/examination_view.dart';
import 'package:doctor_app/features/main/presentation/view/main_view.dart';
import 'package:doctor_app/features/medicines/presentation/views/medicines_view.dart';
import 'package:doctor_app/features/notifications/presentation/view/notification_view.dart';
import 'package:doctor_app/features/onboarding/presentation/view/onboarding_view.dart';
import 'package:doctor_app/features/profile/data/models/user_model.dart';
import 'package:doctor_app/features/splash/presentation/view/splash_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/clinic/data/models/clinic_model.dart';
import '../../features/clinic_edit/presentation/view/clinic_edit_view.dart';

class AppRouter {
  static Route? generateRoute(RouteSettings routeSettings) {
    final args = routeSettings.arguments;
    switch (routeSettings.name) {
      case Routing.splash:
        return _buildRoute(const SplashView());
      case Routing.notification:
        return _buildRoute(NotificationView(
          patientAppointment: args as List<PatientAppointmentModel>,
        ));
      case Routing.onboarding:
        return _buildRoute(const OnboardingView());
      case Routing.signIn:
        return _buildRoute(BlocProvider(
          create: (context) => SignInCubit(getIt<AuthRepo>()),
          child: const SignInView(),
        ));
      case Routing.otp:
        return _buildRoute(BlocProvider(
          create: (context) => OtpCubit(getIt<AuthRepo>()),
          child: OTPView(
            email: args as String,
          ),
        ));
      case Routing.home:
        return _buildRoute(const MainView());
      case Routing.appointmentDetails:
        return _buildRoute(AppointmentDetails(
          patientAppointmentModel: args as PatientAppointmentModel,
        ));
      case Routing.examination:
        return _buildRoute(const ExaminationView());
      case Routing.detailsExamination:
        final examinationModel = args as ExaminationModel;
        return _buildRoute(
          DetailsExaminationView(
            examinationModel: examinationModel,
          ),
        );
      case Routing.clinicDetail:
        return _buildRoute(const ClinicView());
      case Routing.medicines:
        return _buildRoute(const MedicinesView());
      case Routing.editProfile:
        return _buildRoute(BlocProvider(
          create: (context) => EditProfileCubit(getIt<EditProfileRepo>()),
          child: EditProfileView(
            userModel: args as UserModel,
          ),
        ));
      case Routing.clinicEdit:
        final clinicModel = args as ClinicModel;
        return _buildRoute(BlocProvider(
          create: (context) => EditClinicCubit(getIt<EditClinicRepo>())..editClinic(),
          child: ClinicEditView(clinicModel: clinicModel),
        ));

      default:
        return null;
    }
  }

  static Route<dynamic> _buildRoute(Widget page) {
    return Platform.isIOS
        ? CupertinoPageRoute(
            builder: (_) => page,
          )
        : MaterialPageRoute(builder: (_) => page);
  }
}
