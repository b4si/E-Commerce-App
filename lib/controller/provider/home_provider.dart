import 'dart:async';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:e_commerce_app/controller/services/home_services.dart';
import 'package:flutter/material.dart';

class HomeProvider with ChangeNotifier {
  int selectedIndex = 0;
  int activeIndex = 0;
  final dio = Dio();
  List allProducts = [];
  List mobileDataList = [];
  List laptopDataList = [];
  List tabletDataList = [];
  List bannerList = [];
  List results = [];

  void runFilter(String enteredKeyword) {
    log(enteredKeyword);

    if (enteredKeyword.isEmpty) {
      results = allProducts;
    } else {
      results = allProducts
          .where(
            (element) =>
                element['name'].replaceAll(' ', '').toLowerCase().contains(
                      enteredKeyword.replaceAll(' ', '').toLowerCase(),
                    ),
          )
          .toList();
    }

    allProducts = results;
    notifyListeners();
  }

  // void searchResult(List results) {
  //   allProducts = results;
  //   notifyListeners();
  // }

  Future<void> bannerGetter(context) async {
    List<dynamic> vari = await homeServices().getBanner(context);
    bannerList.clear();
    bannerList.addAll(vari);
    notifyListeners();
    log(bannerList.toString());
  }

  Future<void> productsGetter(context) async {
    List<dynamic> vari = await homeServices().getProducts(context);
    mobileDataList.clear();
    laptopDataList.clear();
    tabletDataList.clear();
    allProducts.clear();
    allProducts.addAll(vari);
    for (var i = 0; i < vari.length; i++) {
      if (vari[i]["category"] == 'Mobile Phone') {
        mobileDataList.add(vari[i]);
      } else if (vari[i]["category"] == 'Laptops') {
        laptopDataList.add(vari[i]);
      } else if (vari[i]["category"] == 'Tablets') {
        tabletDataList.add(vari[i]);
      }
      notifyListeners();
    }
  }

  void navigationChanger(int value) {
    selectedIndex = value;
    notifyListeners();
  }

  changeBannerIndex(int index) {
    activeIndex = index;
    notifyListeners();
  }

  // Future<void> getBanner(context) async {
  //   try {
  //     Response response = await dio.get(baseUrl + bannerUrl).timeout(
  //           const Duration(seconds: 15),
  //         );

  //     if (response.statusCode == 200) {
  //       final bannerItems = BannerModel.fromJson(response.data);
  //       bannerList.clear();
  //       bannerList.addAll(bannerItems.banners!.reversed);
  //       notifyListeners();
  //     }
  //     // log(bannerList.toString());
  //   } on SocketException {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(
  //         behavior: SnackBarBehavior.floating,
  //         backgroundColor: Colors.red.shade800,
  //         shape: RoundedRectangleBorder(
  //           borderRadius: BorderRadius.circular(10),
  //         ),
  //         padding: const EdgeInsets.all(15.0),
  //         elevation: 6.0,
  //         margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
  //         content: const Text('No Internet Connection'),
  //       ),
  //     );
  //   } on TimeoutException {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(
  //         behavior: SnackBarBehavior.floating,
  //         backgroundColor: Colors.red.shade800,
  //         shape: RoundedRectangleBorder(
  //           borderRadius: BorderRadius.circular(10),
  //         ),
  //         padding: const EdgeInsets.all(15.0),
  //         elevation: 6.0,
  //         margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
  //         content: const Text('Time out!!'),
  //       ),
  //     );
  //   } on DioError catch (e) {
  //     log(e.error);
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(
  //         behavior: SnackBarBehavior.floating,
  //         backgroundColor: Colors.red.shade800,
  //         shape: RoundedRectangleBorder(
  //           borderRadius: BorderRadius.circular(10),
  //         ),
  //         padding: const EdgeInsets.all(15.0),
  //         elevation: 6.0,
  //         margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
  //         content: const Text('Something went wrong'),
  //       ),
  //     );
  //   }
  // }

  // Future<void> getProducts(BuildContext context) async {
  //   try {
  //     Response response = await dio.get(baseUrl + allProductsUrl).timeout(
  //           const Duration(
  //             seconds: 15,
  //           ),
  //         );
  //     // ignore: use_build_context_synchronously
  //     // getBanner(context);
  //     final getData = ProductModel.fromJson(response.data);
  //     mobileDataList.clear();
  //     laptopDataList.clear();
  //     tabletDataList.clear();
  //     if (response.statusCode == 200) {
  //       for (var i = 0; i < getData.product.length; i++) {
  //         if (getData.product[i]["category"] == 'Mobile Phone') {
  //           mobileDataList.add(getData.product[i]);
  //         } else if (getData.product[i]["category"] == 'Laptops') {
  //           laptopDataList.add(getData.product[i]);
  //         } else if (getData.product[i]["category"] == 'Tablets') {
  //           tabletDataList.add(getData.product[i]);
  //         }
  //       }
  //     }
  //   } on SocketException {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(
  //         behavior: SnackBarBehavior.floating,
  //         backgroundColor: Colors.red.shade800,
  //         shape: RoundedRectangleBorder(
  //           borderRadius: BorderRadius.circular(10),
  //         ),
  //         padding: const EdgeInsets.all(15.0),
  //         elevation: 6.0,
  //         margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
  //         content: const Text('No Internet Connection'),
  //       ),
  //     );
  //   } on TimeoutException {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(
  //         behavior: SnackBarBehavior.floating,
  //         backgroundColor: Colors.red.shade800,
  //         shape: RoundedRectangleBorder(
  //           borderRadius: BorderRadius.circular(10),
  //         ),
  //         padding: const EdgeInsets.all(15.0),
  //         elevation: 6.0,
  //         margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
  //         content: const Text('Time out!!'),
  //       ),
  //     );
  //   } on DioError catch (e) {
  //     if (e.response == null) {
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(
  //           behavior: SnackBarBehavior.floating,
  //           backgroundColor: Colors.red.shade800,
  //           shape: RoundedRectangleBorder(
  //             borderRadius: BorderRadius.circular(10),
  //           ),
  //           padding: const EdgeInsets.all(15.0),
  //           elevation: 6.0,
  //           margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
  //           content: const Text('No Internet'),
  //         ),
  //       );
  //     } else if (e.response!.statusCode == 404) {
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(
  //           behavior: SnackBarBehavior.floating,
  //           backgroundColor: Colors.red.shade800,
  //           shape: RoundedRectangleBorder(
  //             borderRadius: BorderRadius.circular(10),
  //           ),
  //           padding: const EdgeInsets.all(15.0),
  //           elevation: 6.0,
  //           margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
  //           content: const Text('Error occured!!'),
  //         ),
  //       );
  //     }
  //   } catch (e) {
  //     log(e.toString());
  //   }
  // }

}
