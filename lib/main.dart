import 'package:doctor_app/core/helpers/bloc_observer.dart';
import 'package:doctor_app/core/services/get_it.dart';
import 'package:doctor_app/doctor_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  Bloc.observer = MyBlocObserver();
  setup();
  runApp(const DoctorApp());
}
