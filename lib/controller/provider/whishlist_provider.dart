import 'dart:async';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:e_commerce_app/services/wishlist_services.dart';

import 'package:flutter/material.dart';

class WishlistProvider with ChangeNotifier {
  final dio = Dio();

  List wishList = [];

  bool checkingWishlist(id) {
    bool isInWishlist = false;
    for (int i = 0; i < wishList.length; i++) {
      if (wishList[i].product[0].id == id) {
        log(wishList[i].product[0].id);
        isInWishlist = true;
        break;
      }
    }
    return isInWishlist;
  }

  addToWishlistNotifier(BuildContext context, productId) async {
    await WishlistServices().addToWishlist(productId, context);
    notifyListeners();
  }

  Future<void> previewWishlistNotifier() async {
    final gettingData = await WishlistServices().previewWishlist();
    wishList.clear();
    if (gettingData.wishlistProducts.isEmpty) {
      return;
    } else {
      wishList.addAll(gettingData.wishlistProducts.reversed);
    }
    notifyListeners();
  }

  Future<void> wishListDeleteNotifier(BuildContext context, productId) async {
    await WishlistServices().deleteWishlist(context, productId);
    wishList.removeWhere((wishlist) => wishlist.product[0].id == productId);
    notifyListeners();
  }
}
