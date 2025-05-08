class ProductModel {
  final int active;
  final int brandId;
  final String categoryId;
  final String id;
  final List<String> images;
  final String img;

  final int maxQty;
  final int minQty;
  final List<Translation> translations;
  final String type;
  final String unitId;
  final int updatedAt;
  final String uuid;

  ProductModel({
    required this.active,
    required this.brandId,
    required this.categoryId,
    required this.id,
    required this.images,
    required this.img,

    required this.maxQty,
    required this.minQty,
    required this.translations,
    required this.type,
    required this.unitId,
    required this.updatedAt,
    required this.uuid,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      active: json['active'] ?? 0,
      brandId: json['brand_id'] ?? 0,
      categoryId: json['category_id'] ?? "",
      id: json['id'] ?? "",
      images: (json['images'] as List?)?.map((e) => e.toString()).toList() ?? [],
      img: json['img'] ?? "",

      maxQty: json['max_qty'] ?? 0,
      minQty: json['min_qty'] ?? 0,
      translations: (json['translations'] as List?)
          ?.map((e) => Translation.fromJson(e))
          .toList() ??
          [],
      type: json['type'] ?? "",
      unitId: json['unit_id'] ?? "",
      updatedAt: json['updated_at'] ?? 0,
      uuid: json['uuid'] ?? "",
    );
  }
}

class Translation {
  final String description;
  final String locale;
  final String title;

  Translation({
    required this.description,
    required this.locale,
    required this.title,
  });

  factory Translation.fromJson(Map<String, dynamic> json) {
    return Translation(
      description: json['description'] ?? "",
      locale: json['locale'] ?? "",
      title: json['title'] ?? "",
    );
  }
}

