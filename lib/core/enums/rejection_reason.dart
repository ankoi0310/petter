enum RejectionReason {
  notSuitable('Không phù hợp với thú cưng'),
  noExperience('Chưa có kinh nghiệm nuôi'),
  badEnvironment('Môi trường sống không phù hợp'),
  unresponsive('Không phản hồi'),
  other('Khác');

  const RejectionReason(this.label);

  final String label;
}
