import 'package:json_annotation/json_annotation.dart';
part 'otp_sign_in_request_model.g.dart';
@JsonSerializable()
class OtpSignInRequestModel {
  final String email;
  final String otp;

  OtpSignInRequestModel({required this.email, required this.otp});


  Map<String,dynamic> toJson()=>_$OtpSignInRequestModelToJson(this);

}
