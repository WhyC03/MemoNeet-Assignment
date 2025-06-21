import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class BannerCarousel extends StatelessWidget {
  const BannerCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> bannerImages = [
      'assets/images/Physics Combo.png',
      'assets/images/Chemistry Combo.png',
      'assets/images/Biology Combo.png',
    ];

    return CarouselSlider(
      items:
          bannerImages.map((url) {
            return Builder(
              builder: (BuildContext context) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    url,
                    fit: BoxFit.fitWidth,
                    width: double.infinity,
                  ),
                );
              },
            );
          }).toList(),
      options: CarouselOptions(
        autoPlay: true,
        enlargeCenterPage: true,
        viewportFraction: 0.9,
        aspectRatio: 16 / 9,
        autoPlayInterval: Duration(seconds: 6),
        autoPlayAnimationDuration: Duration(seconds: 2),
        pauseAutoPlayInFiniteScroll: false,
      ),
    );
  }
}
