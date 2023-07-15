class DoctorsModel {
  final int id;
  final String name;
  final int categoryId;
  final String image;

  DoctorsModel(
      {required this.id,
      required this.image,
      required this.name,
      required this.categoryId});

  factory DoctorsModel.fromJson(Map<String, dynamic> json) {
    return DoctorsModel(
      id: json['id'],
      name: json['name'],
      categoryId: json['category_id'],
      image: '??',
    );
  }
}
