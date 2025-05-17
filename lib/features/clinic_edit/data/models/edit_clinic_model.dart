class EditClinicModel {
  final String id;
  final String name;
  final int price;
  final double long;
  final double lat;
  final String specialization;

  EditClinicModel({
    required this.id,
    required this.name,
    required this.price,
    required this.long,
    required this.lat,
    required this.specialization,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'long': long,
      'lat': lat,
      'specialization': specialization,
    };
  }
}
