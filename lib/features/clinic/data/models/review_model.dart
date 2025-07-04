class ReviewModel {
  final String id;
  final String clinicId;
  final double rate;
  final String comment;
  final String userName;

  ReviewModel({
    required this.id,
    required this.clinicId,
    required this.rate,
    required this.comment,
    required this.userName,
  });

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      id: json['id'],
      clinicId: json['clinicId'],
      rate: (json['rate'] as num).toDouble(),
      comment: json['comment'],
      userName: json['userName'],
    );
  }
}
