import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

class MyBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    // Perform setup tasks when a bloc is instantiated
    log('Bloc ${bloc.runtimeType} created');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    // React to state changes
    log('Bloc ${bloc.runtimeType} state changed: $change');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    // React to state transitions
    log('Bloc ${bloc.runtimeType} transitioned: $transition');
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    // React to events being added to a bloc
    log('Bloc ${bloc.runtimeType} event added: $event');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    // Handle errors that occur in blocs
    log('Error in bloc ${bloc.runtimeType}: $error');
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    // Perform cleanup tasks when a bloc is closed
    log('Bloc ${bloc.runtimeType} closed');
  }
}
