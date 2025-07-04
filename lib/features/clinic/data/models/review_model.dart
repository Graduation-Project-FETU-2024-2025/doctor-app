class ReviewModel {
  final String reviewerName;
  final double rating;
  final String comment;

  ReviewModel({
    required this.reviewerName,
    required this.rating,
    required this.comment,
  });

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      reviewerName: json['reviewerName'],
      rating: (json['rating'] as num).toDouble(),
      comment: json['comment'],
    );
  }
}
