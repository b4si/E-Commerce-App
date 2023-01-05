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
    // Size size = MediaQuery.of(context).size;

    return Consumer<HomeProvider>(
      builder: (context, value, child) => CarouselSlider.builder(
          options: CarouselOptions(
            height: 190,
            autoPlay: true,
            viewportFraction: 1,
            enlargeCenterPage: true,
            onPageChanged: (index, reason) => value.changeBannerIndex(index),
          ),
          itemCount: value.imageList.length,
          itemBuilder: (context, index, realIndex) {
            final images = value.imageList[index];
            return Image(
              image: NetworkImage(images),
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
          count: value.imageList.length,
          effect: const SlideEffect(
            radius: 10,
            dotHeight: 11,
            dotWidth: 11,
            dotColor: Colors.grey,
            activeDotColor: Colors.teal,
          ),
        ),
      ),
    );
  }
}
