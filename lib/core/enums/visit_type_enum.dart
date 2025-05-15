enum VisitTypeEnum implements Comparable<VisitTypeEnum> {
  checkup(type: 'Checkup'),
  revisit(type: 'Revisit'),
  newVisit(type: 'NewVisit');

  final String type;

  const VisitTypeEnum({required this.type});
  @override
  int compareTo(VisitTypeEnum other) {
    throw UnimplementedError();
  }
}
