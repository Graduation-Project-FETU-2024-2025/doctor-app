class PrescriptionProductDto {
  final String systemProductCode;
  final String description;

  PrescriptionProductDto(
      {required this.systemProductCode, required this.description});
  Map<String, dynamic> toJson() {
    return {
      'systemProductCode': systemProductCode,
      'description': description,
    };
  }
}
