import 'package:doctor_app/features/profile/data/repo/profile_repo.dart';
import 'package:doctor_app/features/profile/presentation/model_view/profile_cubit/profile_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this._profileRepo) : super(ProfileInitial());
  final ProfileRepo _profileRepo;

  void getProfileEmitter() async {
    emit(ProfileLoading());
    final result = await _profileRepo.getUserInfo();

    result.fold(
      (apiErrorModel) => emit(ProfileFailure(apiErrorModel: apiErrorModel)),
      (userModel) => emit(ProfileSuccess(userModel: userModel)),
    );
  }
}
