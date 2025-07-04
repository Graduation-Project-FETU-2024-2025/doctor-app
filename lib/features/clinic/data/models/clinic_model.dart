import '../../../clinic_timing/data/models/appointment_date_model.dart';
import 'review_model.dart';

class ClinicModel {
  final String id;
  final String name;
  final String address;
  final double price;
  final double long;
  final double lat;
  final String specialization;
  final List<String> clinicPhones;
  final String about; 
  final List<ReviewModel> reviews; 
  final List<AppointmentDateModel> appointmentDates;

  ClinicModel({
    required this.id,
    required this.name,
    required this.address,
    required this.price,
    required this.long,
    required this.lat,
    required this.specialization,
    required this.clinicPhones,
    required this.about,
    required this.reviews,
    required this.appointmentDates,
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
      about: json['about'] , 
      reviews: (json['reviews'] as List)
          .map((e) => ReviewModel.fromJson(e))
          .toList(),
      appointmentDates: (json['appointmentDates'] as List)
          .map((e) => AppointmentDateModel.fromJson(e))
          .toList(),
    );
  }
}
