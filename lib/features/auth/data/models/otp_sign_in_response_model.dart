
import 'package:json_annotation/json_annotation.dart';
part 'otp_sign_in_response_model.g.dart';
@JsonSerializable()
class OtpSignInResponseModel {
  @JsonKey(name: 'isAuthuntecated')
  final bool isAuthenticated;
  final String message;
  final String userName;
  final String email;
  final String token;
  final String expiresOn;
  final int status;

  OtpSignInResponseModel({required this.isAuthenticated, required this.message, required this.userName, required this.email, required this.token, required this.expiresOn, required this.status});

  factory OtpSignInResponseModel.fromJson(Map<String,dynamic>json)=>_$OtpSignInResponseModelFromJson(json);
}

