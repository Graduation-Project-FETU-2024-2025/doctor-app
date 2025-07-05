class WorkingPeriodModel {
  final String startTime;
  final String endTime;

  WorkingPeriodModel({
    required this.startTime,
    required this.endTime,
  });

  factory WorkingPeriodModel.fromJson(Map<String, dynamic> json) {
    return WorkingPeriodModel(
      startTime: json['startTime'],
      endTime: json['endTime'],
    );
  }

Map<String, dynamic> toJson() {
    return {
      'startTime': startTime,
      'endTime': endTime,
    };
  }
}