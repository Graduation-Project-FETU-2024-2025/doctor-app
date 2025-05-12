import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:doctor_app/core/database/api/api_consumer.dart';
import 'package:doctor_app/core/database/api/api_error_handler.dart';
import 'package:doctor_app/core/database/api/api_error_model.dart';
import 'package:doctor_app/core/database/api/end_points.dart';
import 'package:doctor_app/core/functions/upload_image_to_api.dart';
import 'package:doctor_app/features/edit_profile/data/repo/edit_profile_repo.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileRepoImpl implements EditProfileRepo {
  final ApiConsumer _apiConsumer;

  EditProfileRepoImpl({required ApiConsumer apiConsumer})
      : _apiConsumer = apiConsumer;
  @override
  Future<Either<ApiErrorModel, String>> editProfile(
      {XFile? image, required String name}) async {
    try {
      Map<String, dynamic> data = {};
      data['Name'] = name;
      if (image != null) {
        data['image'] = await uploadImageToAPI(image);
      }
      final Response response = await _apiConsumer.put(EndPoints.getProfile,
          isFormData: true, data: data);
      if (response.statusCode == 200) {
        return right('Success');
      } else {
        return left(ApiErrorModel(message: 'error while updating'));
      }
    } on Exception catch (e) {
      return left(ApiErrorHandler.handleError(e));
    }
  }
}
