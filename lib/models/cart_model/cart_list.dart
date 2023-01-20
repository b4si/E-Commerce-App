// To parse this JSON data, do
//
//     final cartModel = cartModelFromJson(jsonString);

import 'dart:convert';

CartModel? cartModelFromJson(String str) =>
    CartModel.fromJson(json.decode(str));

String cartModelToJson(CartModel? data) => json.encode(data!.toJson());

class CartModel {
  CartModel({
    required this.cartList,
    required this.subtotal,
    required this.total,
    required this.shipping,
    required this.grandtotal,
  });

  List<CartList> cartList;
  int subtotal;
  int total;
  int shipping;
  int grandtotal;

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
        cartList: json["cartList"] == null
            ? []
            : List<CartList>.from(
                json["cartList"].map((x) => CartList.fromJson(x))),
        subtotal: json["subtotal"],
        total: json["total"],
        shipping: json["shipping"],
        grandtotal: json["grandtotal"],
      );

  Map<String, dynamic> toJson() => {
        "cartList": cartList.isEmpty
            ? []
            : List<dynamic>.from(cartList.map((x) => x.toJson())),
        "subtotal": subtotal,
        "total": total,
        "shipping": shipping,
        "grandtotal": grandtotal,
      };
}

class CartList {
  CartList({
    required this.id,
    required this.item,
    required this.itemQuantity,
    required this.product,
  });

  String id;
  String item;
  int itemQuantity;
  List<Product> product;

  factory CartList.fromJson(Map<String, dynamic> json) => CartList(
        id: json["_id"],
        item: json["item"],
        itemQuantity: json["itemQuantity"],
        product: json["product"] == null
            ? []
            : List<Product>.from(
                json["product"].map((x) => Product.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "item": item,
        "itemQuantity": itemQuantity,
        "product": product.isEmpty
            ? []
            : List<dynamic>.from(product.map((x) => x.toJson())),
      };
}

class Product {
  Product({
    this.id,
    this.name,
    this.price,
    this.discount,
    this.originalPrice,
    this.category,
    this.brand,
    this.highlights,
    this.description,
    this.stock,
    this.expiresAt,
    this.deleted,
    this.images,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  String? id;
  String? name;
  String? price;
  int? discount;
  String? originalPrice;
  String? category;
  String? brand;
  String? highlights;
  String? description;
  int? stock;
  DateTime? expiresAt;
  bool? deleted;
  List<Image?>? images;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

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
        images: json["images"] == null
            ? []
            : List<Image?>.from(json["images"]!.map((x) => Image.fromJson(x))),
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
        "expiresAt": expiresAt?.toIso8601String(),
        "deleted": deleted,
        "images": images == null
            ? []
            : List<dynamic>.from(images!.map((x) => x!.toJson())),
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
      };
}

class Image {
  Image({
    this.url,
    this.filename,
    this.id,
  });

  String? url;
  String? filename;
  String? id;

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
