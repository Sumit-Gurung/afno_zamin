import 'package:afnozamin/pages/constants.dart';
import 'package:flutter/material.dart';

import '../individualPage.dart';

class RecentProducts extends StatelessWidget {
  //creating product list
  final productList = [
    {
      'name': 'Fulbari house',
      'image': 'assets/images/house1.jpg',
      'price': 'Rs.1000000',
      'disc': 'Strong and Solid'
    },
    {
      'name': 'Malepatan house',
      'image': 'assets/images/house2.jpg',
      'price': 'Rs.9000000',
      'disc': 'Strong and Solid'
    },
    {
      'name': 'Srijana chowk house',
      'image': 'assets/images/house3.jpg',
      'price': 'Rs.8000000',
      'disc': 'Strong and Solid'
    },
    {
      'name': 'Bagar house',
      'image': 'assets/images/house4.jpg',
      'price': 'Rs.7000000',
      'disc': 'Strong and Solid'
    },
    {
      'name': 'Lamachour house',
      'image': 'assets/images/house5.jpg',
      'price': 'Rs.6000000',
      'disc': 'Strong and Solid'
    },
    {
      'name': 'Rastrabank chowk house',
      'image': 'assets/images/house6.jpg',
      'price': 'Rs.5000000',
      'disc': 'Strong and Solid'
    },
  ];

  @override
  Widget build(BuildContext context) {
    //creating grid to show columns of items

    return GridView.builder(
        itemCount: productList.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 0.8),
        itemBuilder: (BuildContext context, int index) {
          //assign values to variables
          return RecentSingleProducts(
            recent_single_product_disc: productList[index]['disc'],
            recent_single_product_name: productList[index]['name'],
            recent_single_product_image: productList[index]['image'],
            recent_single_product_price: productList[index]['price'],
          );
        });
  }
}

class RecentSingleProducts extends StatefulWidget {
  final recent_single_product_name;
  final recent_single_product_image;
  final recent_single_product_price;
  final recent_single_product_disc;

  RecentSingleProducts({
    this.recent_single_product_name,
    this.recent_single_product_image,
    this.recent_single_product_price,
    this.recent_single_product_disc,
  });

  @override
  State<RecentSingleProducts> createState() => _RecentSingleProductsState();
}

class _RecentSingleProductsState extends State<RecentSingleProducts> {
  bool islike = false;
  final Color inactiveColor = Colors.white;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8.0),
      padding: EdgeInsets.all(4.0),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(8),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            GestureDetector(
              onTap: (() {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => individualpage()));
              }),
              child: Container(
                height: 140,
                width: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(widget.recent_single_product_image),
                  ),
                ),
              ),
            ),
            ListTile(
                title: Text(widget.recent_single_product_name),
                subtitle: Text(widget.recent_single_product_price),
                // we use trailing widget to create favorite
                trailing: Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                      color: primarycolor,
                      borderRadius: BorderRadius.circular(30)),
                  child: IconButton(
                    icon: Icon(
                      islike ? Icons.favorite : Icons.favorite_border_outlined,
                      color: islike ? Colors.red : inactiveColor,
                      size: 15,
                    ),
                    onPressed: () {
                      setState(() {
                        islike = !islike;
                      });
                    },
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
