import 'dart:convert';

OrderDetailsModel orderDetailsModelFromJson(String str) =>
    OrderDetailsModel.fromJson(json.decode(str));

String orderDetailsModelToJson(OrderDetailsModel data) =>
    json.encode(data.toJson());

class OrderDetailsModel {
  OrderDetailsModel({
    required this.cartList,
  });

  List<CartList> cartList;

  factory OrderDetailsModel.fromJson(Map<String, dynamic> json) =>
      OrderDetailsModel(
        cartList: List<CartList>.from(
            json["cartList"].map((x) => CartList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "cartList": List<dynamic>.from(cartList.map((x) => x.toJson())),
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
        product:
            List<Product>.from(json["product"].map((x) => Product.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "item": item,
        "itemQuantity": itemQuantity,
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

  String id;
  String name;
  String price;
  int discount;
  String originalPrice;
  String category;
  String brand;
  String highlights;
  String description;
  int stock;
  DateTime expiresAt;
  bool deleted;
  List<Image> images;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

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

  String url;
  String filename;
  String id;

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
