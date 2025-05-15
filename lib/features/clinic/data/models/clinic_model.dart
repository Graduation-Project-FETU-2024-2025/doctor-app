class ClinicModel {
  final String id;
  final String name;
  final String address;
  final double price;
  final double long;
  final double lat;
  final String specialization;
  final List<String> clinicPhones;

  ClinicModel({
    required this.id,
    required this.name,
    required this.address,
    required this.price,
    required this.long,
    required this.lat,
    required this.specialization,
    required this.clinicPhones,
  });

  factory ClinicModel.fromJson(Map<String, dynamic> json) {
    return ClinicModel(
      id: json['id'],
      name: json['name'],
      address: json['address'],
      price: (json['price'] as num).toDouble(),
      long: (json['long'] as num).toDouble(),
      lat: (json['lat'] as num).toDouble(),
      specialization: json['specialization'],
      clinicPhones: List<String>.from(json['clinicPhones']),
    );
  }
}