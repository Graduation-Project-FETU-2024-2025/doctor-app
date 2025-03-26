class ApiErrorModel{
  final String? message;
  final int? statusCode;
  final Map<String,dynamic>? errors;

  ApiErrorModel({this.message, this.statusCode, this.errors});


  factory ApiErrorModel.fromJson(Map<String, dynamic> json) {
    return ApiErrorModel(
    message:   json['message'],
    statusCode:   json['statusCode'],
    errors:   json['errors'],
    );
  }

  static String getAllErrorMessage(String? message, Map<String,dynamic>? errors) {
    if (message != null && message.isNotEmpty) {
      return message;
    }
    final errorMessage = errors!.entries.map((entry) {
      final value = entry.value;
      return "${value.join(',')}";
    }).join("\n");
    return errorMessage;
  }

}