import 'package:afnozamin/pages/constants.dart';
import 'package:flutter/material.dart';

class Category extends StatefulWidget {
  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          CategoryProduct(
            press: () {},
            //image location
            image: 'assets/images/house.png',
            text: 'House',
          ),
          SizedBox(
            width: 11,
          ),
          CategoryProduct(
            press: () {},
            //image location
            image: 'assets/images/land.png',
            text: 'land',
          ),
          SizedBox(
            width: 11,
          ),
          CategoryProduct(
            press: () {},
            //image location
            image: 'assets/images/commercial.png',
            text: 'Commercial',
          ),
          SizedBox(
            width: 11,
          ),
        ],
      ),
    );
  }
}

class CategoryProduct extends StatelessWidget {
  const CategoryProduct({
    Key? key,
    required this.image,
    required this.text,
    required this.press,
  }) : super(key: key);
  final String image, text;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: GestureDetector(
        onTap: press,
        child: Container(
          child: Chip(
            label: Row(
              children: [
                Image.asset(
                  image,
                  height: 40,
                ),
                Text(text),
                SizedBox(
                  width: 0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
