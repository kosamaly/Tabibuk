class DoctorsModel {
  final int doctorId;
  final String name;
  final int categoryId;
  final String image;

  DoctorsModel(
      {required this.doctorId,
      required this.image,
      required this.name,
      required this.categoryId});

  factory DoctorsModel.fromJson(Map<String, dynamic> json) {
    return DoctorsModel(
      doctorId: json['doctor_id'],
      name: json['name'],
      categoryId: json['category_id'],
      image: json['image'] ?? "",
    );
  }
}
