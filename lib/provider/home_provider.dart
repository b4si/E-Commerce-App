import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:e_commerce_app/links/url.dart';
import 'package:e_commerce_app/models/product_model.dart';
import 'package:flutter/material.dart';

class HomeProvider with ChangeNotifier {
  int selectedIndex = 0;
  int activeIndex = 0;
  final dio = Dio();
  List mobileDataList = [];
  List laptopDataList = [];
  List tabletDataList = [];

  Future<void> getProducts(BuildContext context) async {
    try {
      Response response = await dio.get('$baseUrl/allProducts').timeout(
            const Duration(
              seconds: 15,
            ),
          );

      final getData = ProductModel.fromJson(response.data);
      mobileDataList.clear();
      laptopDataList.clear();
      tabletDataList.clear();
      if (response.statusCode == 200) {
        for (var i = 0; i < getData.product.length; i++) {
          if (getData.product[i]["category"] == 'Mobile Phone') {
            mobileDataList.add(getData.product[i]);
          } else if (getData.product[i]["category"] == 'Laptops') {
            laptopDataList.add(getData.product[i]);
          } else if (getData.product[i]["category"] == 'Tablets') {
            tabletDataList.add(getData.product[i]);
          }
        }
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
          content: const Text('No Internet Connection'),
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
          content: const Text('Time out!!'),
        ),
      );
    } on DioError catch (e) {
      if (e.response == null) {
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
            content: const Text('No Internet'),
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
            content: const Text('Error occured!!'),
          ),
        );
      }
    } catch (e) {
      log(e.toString());
    }
  }

  List<String> imageList = [
    'https://image01.realme.net/general/20221216/1671203341519.jpg.webp',
    'https://i03.appmifile.com/572_operator_in/19/12/2022/830e5a8177242f31d03708f7b8af03a8.jpg?f=webp',
    'https://www.oneplus.in/content/dam/oasis/page/2022/eu/launch/11/1223/pad.jpg.thumb.webp',
  ];

  void navigationChanger(int value) {
    selectedIndex = value;
    notifyListeners();
  }

  changeBannerIndex(int index) {
    activeIndex = index;
    notifyListeners();
  }
}
