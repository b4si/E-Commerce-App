import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:e_commerce_app/core/url.dart';
import 'package:e_commerce_app/models/wishlist_model.dart';
import 'package:flutter/material.dart';

import '../models/user_model.dart';

class WishlistServices {
  final dio = Dio();
  Future<void> addToWishlist(productId, context) async {
    try {
      Response response = await dio.get(
        '$baseUrl/addToWishlist/${productId.toString()}/${emailIds['user']['_id'].toString()}',
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        // notifyListeners();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.green.shade800,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.all(15.0),
            elevation: 6.0,
            margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
            content: const Text('Successfully added to Wishlist'),
          ),
        );
      }
    } on SocketException {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.red.shade800,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.all(15.0),
          elevation: 6.0,
          margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          content: const Text('Check Internet connection'),
        ),
      );
    } on TimeoutException {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.red.shade800,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.all(15.0),
          elevation: 6.0,
          margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          content: const Text('Check internet connection'),
        ),
      );
    } on DioError catch (e) {
      if (e.response == null) {
        Navigator.of(context).pop();
        return showDialog(
          context: context,
          builder: (context) => const Center(
            child: AlertDialog(
              content: Text('No internet connection '),
            ),
          ),
        );
      } else if (e.response!.statusCode == 404) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.red.shade800,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.all(15.0),
            elevation: 6.0,
            margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
            content: const Text('Error'),
          ),
        );
      } else if (e.response!.statusCode == 400) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.orange.shade800,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.all(15.0),
            elevation: 6.0,
            margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
            content: const Text('Product already exist'),
          ),
        );
      }
    } catch (e) {
      log(e.toString());
    }
  }

  Future previewWishlist() async {
    try {
      Response response =
          await dio.get('$baseUrl/wishlist/${emailIds['user']['_id']}');
      final wishListItem = WishListModel.fromJson(response.data);
      // wishList.clear();
      return wishListItem;
      // wishList.addAll(wishListItem.wishlistProducts.reversed);

      // notifyListeners();
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> deleteWishlist(context, productId) async {
    try {
      Response response = await dio.delete(
        '$baseUrl/deleteWishlistItem/$productId/${emailIds['user']['_id']}',
      );

      // wishList.removeWhere((wishlist) => wishlist.product[0].id == productId);
      // notifyListeners();
      log(
        response.data.toString(),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        // notifyListeners();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.orange.shade800,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.all(15.0),
            elevation: 6.0,
            margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
            content: const Text('Item Removed from Wishlist'),
          ),
        );
      }
    } on SocketException {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.red.shade800,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.all(15.0),
          elevation: 6.0,
          margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          content: const Text('Check Internet connection'),
        ),
      );
    } on TimeoutException {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.red.shade800,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.all(15.0),
          elevation: 6.0,
          margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          content: const Text('Something went wrong'),
        ),
      );
    } catch (e) {
      log(e.toString());
    }
  }
}
