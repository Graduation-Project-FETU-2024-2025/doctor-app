class PrescriptionMedicineModel {
  final String id;
  final String name;
  int dosage;
  String instructions;

  PrescriptionMedicineModel({
    required this.id,
    required this.name,
    required this.dosage,
    required this.instructions,
  });
  void updateDosage(int newDosage) => dosage = newDosage;
  void updateInstructions(String newInstructions) =>
      instructions = newInstructions;
  PrescriptionMedicineModel copyWith({
    String? id,
    String? name,
    int? dosage,
    String? instructions,
  }) {
    return PrescriptionMedicineModel(
      id: id ?? this.id,
      name: name ?? this.name,
      dosage: dosage ?? this.dosage,
      instructions: instructions ?? this.instructions,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'dosage': dosage,
      'instructions': instructions,
    };
  }
}
