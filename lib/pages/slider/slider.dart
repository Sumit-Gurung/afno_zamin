import 'package:afnozamin/pages/constants.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';

class ProductSlider extends StatefulWidget {
  @override
  State<ProductSlider> createState() => _ProductSliderState();
}

class _ProductSliderState extends State<ProductSlider> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 200,
        child: Carousel(
          images: [
            AssetImage('assets/images/a.jpg'),
            AssetImage('assets/images/b.jpg'),
            AssetImage('assets/images/c.jpg'),
            AssetImage('assets/images/d.jpg'),
          ],
          borderRadius: true,
          radius: Radius.circular(30),
          dotBgColor: Colors.transparent,
          dotIncreasedColor: primarycolor,
          animationCurve: Curves.fastLinearToSlowEaseIn,
          animationDuration: Duration(
            milliseconds: 500,
          ),
        ),
      ),
    );
  }
}
