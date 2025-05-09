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

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MedicineModel &&
          runtimeType == other.runtimeType &&
          id == other.id;

  @override
  int get hashCode => id.hashCode;
}
