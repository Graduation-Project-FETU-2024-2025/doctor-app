import 'package:doctor_app/features/auth/data/repository/auth_repo.dart';
import 'package:doctor_app/features/auth/presentation/view_model/sign_in_cubit/sign_in_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class SignInCubit extends Cubit<SignInState> {
  SignInCubit(this.authRepo) : super(SignInInitial());
  final AuthRepo authRepo;
  static SignInCubit get(context) => BlocProvider.of<SignInCubit>(context);

  final TextEditingController emailController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void signUpStateEmitter() async {
    emit(SignInLoading());
    final result = await authRepo.login(emailController.text);
    result.fold(
      (apiErrorModel) {
        emit(SignInFailure(apiErrorModel: apiErrorModel));
      },
      (successMessage) {
        emit(SignInSuccess(message: successMessage));
      },
    );
  }

  @override
  Future<void> close() {
    emailController.dispose();
    return super.close();
  }
}
