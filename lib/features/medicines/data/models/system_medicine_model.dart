class SystemMedicineModel {
  final String code;
  final String name;
  final String image;
  final String type;
  final String activePrincipal;
  final String companyName;

  SystemMedicineModel({
    required this.code,
    required this.name,
    required this.image,
    required this.type,
    required this.activePrincipal,
    required this.companyName,
  });

  factory SystemMedicineModel.fromJson(Map<String, dynamic> json) {
    return SystemMedicineModel(
      code: json['code'],
      name: json['name'],
      image: json['image'],
      type: json['type'],
      activePrincipal: json['active_principal'],
      companyName: json['company_Name'],
    );
  }
}
