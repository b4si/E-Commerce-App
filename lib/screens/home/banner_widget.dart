// ignore_for_file: must_be_immutable
import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce_app/provider/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BannerContainer extends StatelessWidget {
  const BannerContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, value, child) => CarouselSlider.builder(
          options: CarouselOptions(
            height: 160,
            autoPlay: true,
            viewportFraction: 1,
            enlargeCenterPage: true,
            onPageChanged: (index, reason) => value.changeBannerIndex(index),
          ),
          itemCount: value.bannerList.length,
          itemBuilder: (context, index, realIndex) {
            return Image(
              image: NetworkImage(value.bannerList[index]["images"][0]["url"]),
              fit: BoxFit.cover,
            );
          }),
    );
  }
}

class BannerDots extends StatelessWidget {
  const BannerDots({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: buildIndicator());
  }

  Widget buildIndicator() {
    return Consumer<HomeProvider>(
      builder: (context, value, child) => SizedBox(
        child: AnimatedSmoothIndicator(
          activeIndex: value.activeIndex,
          count: value.bannerList.length,
          effect: SlideEffect(
            radius: 10,
            dotHeight: 11,
            dotWidth: 11,
            dotColor: Colors.grey,
            activeDotColor: Colors.teal.shade400,
          ),
        ),
      ),
    );
  }
}

// class Shimmer extends StatelessWidget {
//   const Shimmer({
//     super.key,
//     required this.width,
//     required this.height,
//   });

//   final double width;
//   final double height;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: height,
//       width: width,
    
//     );
//   }
// }
