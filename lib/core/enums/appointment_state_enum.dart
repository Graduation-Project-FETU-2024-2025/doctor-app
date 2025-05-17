enum AppointmentStateEnum implements Comparable<AppointmentStateEnum>{
  pending(status: 'Pending'),
  decliened(status: 'Decliened'),
  accepted(status: 'Accepted'), 
  ;
  final String status;

  const AppointmentStateEnum({required this.status});
  @override
  int compareTo(AppointmentStateEnum other) {
    
    throw UnimplementedError();
  }
}