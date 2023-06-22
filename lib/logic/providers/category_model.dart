class CategoryModel {
  final int id;
  final String name;
  final String image;

  CategoryModel({
    required this.id,
    required this.name,
    required this.image,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['category_id'],
      name: json['category_name'],
      image: json['category_image'] ?? '',
    );
  }
}
