class CategoryModel {
  final int categoryId;
  final String name;
  final String image;

  CategoryModel({
    required this.categoryId,
    required this.name,
    required this.image,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      categoryId: json['category_id'],
      name: json['category_name'],
      image: json['category_image'] ?? '',
    );
  }
}
