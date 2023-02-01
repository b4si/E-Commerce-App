import 'dart:convert';

OrderSuccesModel orderSuccesModelFromJson(String str) =>
    OrderSuccesModel.fromJson(json.decode(str));

String orderSuccesModelToJson(OrderSuccesModel data) =>
    json.encode(data.toJson());

class OrderSuccesModel {
  OrderSuccesModel({
    required this.cartList,
    required this.bill,
    required this.shipping,
    required this.orderData,
  });

  List<dynamic> cartList;
  int bill;
  int shipping;
  List<OrderDatum> orderData;

  factory OrderSuccesModel.fromJson(Map<String, dynamic> json) =>
      OrderSuccesModel(
        cartList: List<dynamic>.from(json["cartList"].map((x) => x)),
        bill: json["bill"],
        shipping: json["shipping"],
        orderData: List<OrderDatum>.from(
            json["orderData"].map((x) => OrderDatum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "cartList": List<dynamic>.from(cartList.map((x) => x)),
        "bill": bill,
        "shipping": shipping,
        "orderData": List<dynamic>.from(orderData.map((x) => x.toJson())),
      };
}

class OrderDatum {
  OrderDatum({
    required this.address,
    required this.id,
    required this.userId,
    required this.cartItems,
    required this.paymentStatus,
    required this.bill,
    required this.orderStatus,
    required this.isCompleted,
    required this.expectedDate,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  Address address;
  String id;
  String userId;
  List<CartItem> cartItems;
  String paymentStatus;
  int bill;
  List<OrderStatus> orderStatus;
  bool isCompleted;
  DateTime expectedDate;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  factory OrderDatum.fromJson(Map<String, dynamic> json) => OrderDatum(
        address: Address.fromJson(json["address"]),
        id: json["_id"],
        userId: json["userId"],
        cartItems: List<CartItem>.from(
            json["cartItems"].map((x) => CartItem.fromJson(x))),
        paymentStatus: json["paymentStatus"],
        bill: json["bill"],
        orderStatus: List<OrderStatus>.from(
            json["orderStatus"].map((x) => OrderStatus.fromJson(x))),
        isCompleted: json["isCompleted"],
        expectedDate: DateTime.parse(json["expectedDate"]),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "address": address.toJson(),
        "_id": id,
        "userId": userId,
        "cartItems": List<dynamic>.from(cartItems.map((x) => x.toJson())),
        "paymentStatus": paymentStatus,
        "bill": bill,
        "orderStatus": List<dynamic>.from(orderStatus.map((x) => x.toJson())),
        "isCompleted": isCompleted,
        "expectedDate": expectedDate.toIso8601String(),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
      };
}

class Address {
  Address({
    required this.name,
    required this.email,
    required this.mobile,
    required this.addressLine,
  });

  String name;
  String email;
  String mobile;
  String addressLine;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        name: json["name"],
        email: json["email"],
        mobile: json["mobile"],
        addressLine: json["addressLine"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "mobile": mobile,
        "addressLine": addressLine,
      };
}

class CartItem {
  CartItem({
    required this.productId,
    required this.quantity,
    required this.id,
  });

  String productId;
  int quantity;
  String id;

  factory CartItem.fromJson(Map<String, dynamic> json) => CartItem(
        productId: json["productId"],
        quantity: json["quantity"],
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "productId": productId,
        "quantity": quantity,
        "_id": id,
      };
}

class OrderStatus {
  OrderStatus({
    required this.type,
    required this.date,
    required this.id,
  });

  String type;
  DateTime date;
  String id;

  factory OrderStatus.fromJson(Map<String, dynamic> json) => OrderStatus(
        type: json["type"],
        date: DateTime.parse(json["date"]),
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "date": date.toIso8601String(),
        "_id": id,
      };
}
