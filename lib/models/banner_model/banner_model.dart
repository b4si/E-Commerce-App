import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

class BannerModel {
  List<dynamic>? banners;

  BannerModel({this.banners});

  factory BannerModel.fromJson(Map<String, dynamic> json) {
    return BannerModel(banners: json["banners"]);
  }

  Map<String, dynamic> toJson() => {"banners": banners};
}

@JsonSerializable()
class Banner {
  List<Image>? images;

  Banner({
    this.images,
  });

  factory Banner.fromJson(Map<String, dynamic> json) {
    return Banner(images: json["images"]);
  }

  Map<String, dynamic> toJson() => {"images": images};
}
