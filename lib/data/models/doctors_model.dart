class DoctorsModel {
  final String id;
  final String name;
  final String image;

  DoctorsModel({
    required this.id,
    required this.name,
    required this.image,
  });

  factory DoctorsModel.fromJson(Map<String, dynamic> json) {
    return DoctorsModel(
      id: json['doctor_id'],
      name: json['doctor_name'],
      image: json['category_image'] ?? '',
    );
  }
}
