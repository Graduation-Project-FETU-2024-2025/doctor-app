import 'package:dartz/dartz.dart';
import 'package:doctor_app/core/database/api/api_error_model.dart';
import 'package:image_picker/image_picker.dart';

abstract class EditProfileRepo {
  Future<Either<ApiErrorModel, String>> editProfile({XFile? image,required String name});
}
