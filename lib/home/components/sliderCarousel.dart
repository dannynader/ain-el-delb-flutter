import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class SlidersCarousel extends StatelessWidget {

  final List slidersData;
   const SlidersCarousel({required this.slidersData,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        initialPage: 0,
        enableInfiniteScroll: true,
        reverse: true,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 3),
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        // enlargeCenterPage: true,
        // scrollDirection: Axis.horizontal,
      ),
      items: slidersData.map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Image.network("http://api.aineldelb.gov.lb/storage/"+i["slider"]);
          },
        );
      }).toList(),
    );
  }
}
