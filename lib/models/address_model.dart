import 'dart:convert';

AddressModel addressModelFromJson(String str) =>
    AddressModel.fromJson(json.decode(str));

String addressModelToJson(AddressModel data) => json.encode(data.toJson());

class AddressModel {
  AddressModel({
    required this.address,
  });

  final List<Address> address;

  factory AddressModel.fromJson(Map<String, dynamic> json) => AddressModel(
        address:
            List<Address>.from(json["address"].map((x) => Address.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "address": List<dynamic>.from(address.map((x) => x.toJson())),
      };
}

class Address {
  Address({
    required this.id,
    required this.userId,
    required this.houseNo,
    required this.street,
    required this.district,
    required this.state,
    required this.pincode,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  final String id;
  final String userId;
  final String houseNo;
  final String street;
  final String district;
  final String state;
  final int pincode;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        id: json["_id"],
        userId: json["userId"],
        houseNo: json["houseNo"],
        street: json["street"],
        district: json["district"],
        state: json["state"],
        pincode: json["pincode"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "userId": userId,
        "houseNo": houseNo,
        "street": street,
        "district": district,
        "state": state,
        "pincode": pincode,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
      };
}
