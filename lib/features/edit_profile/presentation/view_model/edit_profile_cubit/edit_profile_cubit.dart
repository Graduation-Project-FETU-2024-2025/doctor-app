import 'package:doctor_app/features/edit_profile/data/repo/edit_profile_repo.dart';
import 'package:doctor_app/features/edit_profile/presentation/view_model/edit_profile_cubit/edit_profile_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  EditProfileCubit(this.editProfileRepo) : super(EditProfileInitial());
  final EditProfileRepo editProfileRepo;
  XFile? pickedImage;

  void editProfile() async {
    emit(EditProfileLoading());
    final result = await editProfileRepo.editProfile(
        name: nameController.text, image: pickedImage);

    result.fold(
      (l) => emit(EditProfileFailure()),
      (r) => emit(EditProfileSuccess()),
    );
  }

  TextEditingController nameController = TextEditingController();
  Future pickImageFromGallery() async {
    pickedImage = await _pickImage(source: ImageSource.gallery);
    pickedImage != null ? emit(PickImageDone()) : null;
  }

  Future pickImageFromCamera() async {
    pickedImage = await _pickImage(source: ImageSource.camera);
    pickedImage != null ? emit(PickImageDone()) : null;
  }

  Future<XFile?> _pickImage({required ImageSource source}) async {
    final ImagePicker picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: source);
    return pickedImage;
  }

  @override
  Future<void> close() {
    nameController.dispose();
    return super.close();
  }
}
