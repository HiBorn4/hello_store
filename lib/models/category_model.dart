class CategoryModel
{
  final int input;
  final String keywords;
  final String? parent;
  final String? shop;
  final String status;
  final String title;
  final String ?description;
  final String img;
  CategoryModel( {
    required this.input,
    required this.keywords,
    this.parent,
    this.shop,
    required this.status,
    required this.title,
    required this.description,
    required this.img,
});

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      input: json['input'] ?? 0,
      keywords: json['keywords'] ?? '',
      status: json['status'] ?? '',
      title: json['title'] ?? '',
      parent: json['parent'],
      shop: json['shop'],
      description: json['description'] ?? '',
      img: json['img']??''
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'input': input,
      'keywords': keywords,
      'status': status,
      'title': title,
      'parent': parent,
      'shop': shop,
      'description': description,
      'img' :img
    };
  }


}