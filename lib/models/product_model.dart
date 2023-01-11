class ProductModel {
  ProductModel({
    required this.product,
  });

  final List<dynamic> product;

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      ProductModel(product: json["product"]);
  Map<String, dynamic> toJson() => {"product": product};
}

class Product {
  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.discount,
    required this.originalPrice,
    required this.category,
    required this.brand,
    required this.highlights,
    required this.description,
    required this.stock,
    required this.expiresAt,
    required this.deleted,
    required this.images,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  final String? id;
  final String? name;
  final String? price;
  final int? discount;
  final String? originalPrice;
  final String? category;
  final String? brand;
  final String? highlights;
  final String? description;
  final int? stock;
  final DateTime? expiresAt;
  final bool? deleted;
  final List<dynamic> images;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["_id"],
        name: json["name"],
        price: json["price"],
        discount: json["discount"],
        originalPrice: json["originalPrice"],
        category: json["category"],
        brand: json["brand"],
        highlights: json["highlights"],
        description: json["description"],
        stock: json["stock"],
        expiresAt: json["expiresAt"],
        deleted: json["deleted"],
        images: json["images"],
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "price": price,
        "discount": discount,
        "originalPrice": originalPrice,
        "category": category,
        "brand": brand,
        "highlights": highlights,
        "description": description,
        "stock": stock,
        "expiresAt": expiresAt,
        "deleted": deleted,
        "images": images,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
        "__v": v,
      };
}

class ImageList {
  ImageList({
    required this.url,
    required this.filename,
    required this.id,
  });

  final String? url;
  final String? filename;
  final String? id;

  factory ImageList.fromJson(Map<String, dynamic> json) => ImageList(
        url: json["url"],
        filename: json["filename"],
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "filename": filename,
        "_id": id,
      };
}
