class ClinicStatisticsModel {
  final int reVisitCount;
  final int checkupCount;
  final int pendingAppointments;
  final int confirmedAppointments;
  final int canceledAppointments;
  final double totalIncome;

  ClinicStatisticsModel(
      {required this.reVisitCount,
      required this.checkupCount,
      required this.pendingAppointments,
      required this.confirmedAppointments,
      required this.canceledAppointments,
      required this.totalIncome});

  factory ClinicStatisticsModel.fromJson(Map<String, dynamic> json) {
    return ClinicStatisticsModel(
      reVisitCount: json['reVisitCount'] ?? 0,
      checkupCount: json['checkupCount'] ?? 0,
      pendingAppointments: json['pendingAppointments'] ?? 0,
      confirmedAppointments: json['confirmedAppointments'] ?? 0,
      canceledAppointments: json['canceledAppointments'] ?? 0,
      totalIncome: (json['totalIncome'] as num?)?.toDouble() ?? 0.0,
    );
  }
}
