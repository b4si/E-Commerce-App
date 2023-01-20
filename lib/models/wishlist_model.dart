import 'dart:convert';

WishListModel wishListModelFromJson(String str) =>
    WishListModel.fromJson(json.decode(str));

String wishListModelToJson(WishListModel data) => json.encode(data.toJson());

class WishListModel {
  WishListModel({
    required this.wishlistProducts,
  });

  final List<WishlistProduct> wishlistProducts;

  factory WishListModel.fromJson(Map<String, dynamic> json) => WishListModel(
        wishlistProducts: List<WishlistProduct>.from(
            json["wishlistProducts"].map((x) => WishlistProduct.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "wishlistProducts":
            List<dynamic>.from(wishlistProducts.map((x) => x.toJson())),
      };
}

class WishlistProduct {
  WishlistProduct({
    required this.id,
    required this.item,
    required this.product,
  });

  final String id;
  final String item;
  final List<Product> product;

  factory WishlistProduct.fromJson(Map<String, dynamic> json) =>
      WishlistProduct(
        id: json["_id"],
        item: json["item"],
        product:
            List<Product>.from(json["product"].map((x) => Product.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "item": item,
        "product": List<dynamic>.from(product.map((x) => x.toJson())),
      };
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

  final String id;
  final String name;
  final String price;
  final int discount;
  final String originalPrice;
  final String category;
  final String brand;
  final String highlights;
  final String description;
  final int stock;
  final DateTime expiresAt;
  final bool deleted;
  final List<Image> images;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;

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
        expiresAt: DateTime.parse(json["expiresAt"]),
        deleted: json["deleted"],
        images: List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
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
        "expiresAt": expiresAt.toIso8601String(),
        "deleted": deleted,
        "images": List<dynamic>.from(images.map((x) => x.toJson())),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
      };
}

class Image {
  Image({
    required this.url,
    required this.filename,
    required this.id,
  });

  final String url;
  final String filename;
  final String id;

  factory Image.fromJson(Map<String, dynamic> json) => Image(
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
