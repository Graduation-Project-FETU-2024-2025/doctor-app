import 'package:doctor_app/features/appointment/data/models/patient_appointment_model.dart';
import 'package:doctor_app/features/appointment/presentation/view_model/appointment_cubit/appointment_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum CurrentAppointment { past, upComing }

class AppointmentCubit extends Cubit<AppointmentState> {
  AppointmentCubit() : super(AppointmentInitial());

  List<PatientAppointmentModel> upcomingAppointment = [
    PatientAppointmentModel(
      date: '12 JAN 2024',
      patientImageUrl:
          'https://th.bing.com/th/id/R.69b6c7c1419fedc585d4aac2958c5ae4?rik=Ti4lNMU9Co54jg&pid=ImgRaw&r=0',
      patientName: 'upcoming1',
      startTime: '10:00 AM',
      endTime: '11:00 PM',
    ),
    PatientAppointmentModel(
      date: '12 JAN 2024',
      patientImageUrl:
          'https://th.bing.com/th/id/R.69b6c7c1419fedc585d4aac2958c5ae4?rik=Ti4lNMU9Co54jg&pid=ImgRaw&r=0',
      patientName: 'upcoming2',
      startTime: '10:00 AM',
      endTime: '11:00 PM',
    ),
    PatientAppointmentModel(
      date: '12 JAN 2024',
      patientImageUrl:
          'https://th.bing.com/th/id/R.69b6c7c1419fedc585d4aac2958c5ae4?rik=Ti4lNMU9Co54jg&pid=ImgRaw&r=0',
      patientName: 'upcoming3',
      startTime: '10:00 AM',
      endTime: '11:00 PM',
    ),
  ];
  List<PatientAppointmentModel> pastAppointment = [
    PatientAppointmentModel(
      date: '12 JAN 2024',
      patientImageUrl:
          'https://th.bing.com/th/id/R.69b6c7c1419fedc585d4aac2958c5ae4?rik=Ti4lNMU9Co54jg&pid=ImgRaw&r=0',
      patientName: 'past1',
      startTime: '12:00 AM',
      endTime: '5:00 PM',
    ),
    PatientAppointmentModel(
      date: '12 JAN 2024',
      patientImageUrl:
          'https://th.bing.com/th/id/R.69b6c7c1419fedc585d4aac2958c5ae4?rik=Ti4lNMU9Co54jg&pid=ImgRaw&r=0',
      patientName: 'past2',
      startTime: '12:00 AM',
      endTime: '5:00 PM',
    ),
    PatientAppointmentModel(
      date: '12 JAN 2024',
      patientImageUrl:
          'https://th.bing.com/th/id/R.69b6c7c1419fedc585d4aac2958c5ae4?rik=Ti4lNMU9Co54jg&pid=ImgRaw&r=0',
      patientName: 'past3',
      startTime: '12:00 AM',
      endTime: '5:00 PM',
    ),
  ];

  CurrentAppointment appointment = CurrentAppointment.upComing;
  void selectAppointmentTypes(CurrentAppointment currentAppointment) {
    if (appointment != currentAppointment) {
      appointment = currentAppointment;
      emit(ChangeAppointmentOption());
    }
  }
}
