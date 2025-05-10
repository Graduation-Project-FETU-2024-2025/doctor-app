class MedicineModel {
  final String id;
  final String? imageUrl;
  final String name;
  final int dosage;
  final String? additionalInstructions;

  MedicineModel({
    required this.name,
    required this.dosage,
    this.additionalInstructions,
    required this.id,
    this.imageUrl,
  });

  MedicineModel copyWith({
    String? id,
    String? imageUrl,
    String? name,
    int? dosage,
    String? additionalInstructions,
  }) {
    return MedicineModel(
      id: id ?? this.id,
      imageUrl: imageUrl ?? this.imageUrl,
      name: name ?? this.name,
      dosage: dosage ?? this.dosage,
      additionalInstructions:
          additionalInstructions ?? this.additionalInstructions,
    );
  }
}
