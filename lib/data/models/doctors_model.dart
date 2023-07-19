class DoctorsModel {
  final int doctorId;
  final String name;
  final int categoryId;
  final String specialty;
  final double rate;
  final String image;
  final int sessionPrice;

  DoctorsModel({
    required this.doctorId,
    required this.name,
    required this.categoryId,
    required this.specialty,
    required this.rate,
    required this.image,
    required this.sessionPrice,
  });

  factory DoctorsModel.fromJson(Map<String, dynamic> json) {
    return DoctorsModel(
      doctorId: json['doctor_id'],
      name: json['name'],
      categoryId: json['category_id'],
      specialty: json['specialty'],
      rate: (json['rate'] as num).toDouble(),
      image: json['image'] ?? "",
      sessionPrice: json['session_price'],
    );
  }
}
