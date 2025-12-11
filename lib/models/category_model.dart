class CategoryModel {
  final int? id;
  final String? userId;
  final String name;
  final String color;
  final String? desc;

  CategoryModel({
    this.id,
    required this.name,
    required this.color,
    this.desc,
    this.userId,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'],
      userId: json['user_id'] ?? '',
      name: json['name'],
      color: json['color'],
      desc: json['desc'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'user_id': userId, 'name': name, 'color': color, 'desc': desc};
  }
}
