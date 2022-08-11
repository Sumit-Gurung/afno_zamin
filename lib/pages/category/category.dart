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
      child: Column(
        children: [
          CategoryProduct(
              image: 'assets/images/e.png', text: 'Land', press: () {}),
          SizedBox(
            width: 20,
          ),
          CategoryProduct(
              image: 'assets/images/e.png', text: 'House', press: () {}),
          SizedBox(
            width: 20,
          ),
          CategoryProduct(
              image: 'assets/images/e.png', text: 'Commerial', press: () {}),
          SizedBox(
            width: 20,
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
            backgroundColor: primarycolor,
            label: Row(
              children: [
                Image.asset(
                  image,
                  height: 40,
                ),
                SizedBox(
                  width: 20,
                ),
                Text(text),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
