import 'dart:io';

import 'package:doctor_app/core/routers/routing.dart';
import 'package:doctor_app/core/services/get_it.dart';
import 'package:doctor_app/features/appointment/data/models/patient_appointment_model.dart';
import 'package:doctor_app/features/appointment_details/presentation/view/appointment_details.dart';
import 'package:doctor_app/features/auth/data/repository/auth_repo.dart';
import 'package:doctor_app/features/auth/presentation/view_model/otp_cubit/otp_cubit.dart';
import 'package:doctor_app/features/auth/presentation/view_model/sign_in_cubit/sign_in_cubit.dart';
import 'package:doctor_app/features/auth/presentation/views/otp_view.dart';
import 'package:doctor_app/features/auth/presentation/views/sign_in_view.dart';
import 'package:doctor_app/features/clinic/presentation/view/clinic_view.dart';
import 'package:doctor_app/features/examination/data/models/examination_model.dart';
import 'package:doctor_app/features/examination/presentation/view_models/examination_cubit/examination_cubit.dart';
import 'package:doctor_app/features/examination/presentation/views/details_examination_view.dart';
import 'package:doctor_app/features/examination/presentation/views/examination_view.dart';
import 'package:doctor_app/features/main/presentation/view/main_view.dart';
import 'package:doctor_app/features/onboarding/presentation/view/onboarding_view.dart';
import 'package:doctor_app/features/splash/presentation/view/splash_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/clinic_edit/presentation/view/clinic_edit_view.dart';

class AppRouter {
  static Route? generateRoute(RouteSettings routeSettings) {
    final args = routeSettings.arguments;
    switch (routeSettings.name) {
      case Routing.splash:
        return _buildRoute(SplashView());
      case Routing.onboarding:
        return _buildRoute(OnboardingView());
      case Routing.signIn:
        return _buildRoute(BlocProvider(
          create: (context) => SignInCubit(getIt<AuthRepo>()),
          child: SignInView(),
        ));
      case Routing.otp:
        return _buildRoute(BlocProvider(
          create: (context) => OtpCubit(getIt<AuthRepo>()),
          child: OTPView(
            email: args as String,
          ),
        ));
      case Routing.home:
        return _buildRoute(MainView());
      case Routing.appointmentDetails:
        return _buildRoute(AppointmentDetails(
          patientAppointmentModel: args as PatientAppointmentModel,
        ));
      case Routing.examination:
        return _buildRoute(BlocProvider(
          create: (context) => ExaminationCubit(),
          child: ExaminationView(),
        ));
      case Routing.detailsExamination:
        final examinationModel = args as ExaminationModel;
        return _buildRoute(
          DetailsExaminationView(
            examinationModel: examinationModel,
          ),
        );
      case Routing.clinicDetail:
        return _buildRoute(ClinicView());
      case Routing.clinicEdit:
        return _buildRoute(ClinicEditView());

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
