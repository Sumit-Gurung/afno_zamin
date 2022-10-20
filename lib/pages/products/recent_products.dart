import 'package:afnozamin/pages/constants.dart';
import 'package:flutter/material.dart';

class RecentProducts extends StatelessWidget {
  //creating product list

  @override
  Widget build(BuildContext context) {
    //creating grid to show columns of items

    return GridView.builder(
        itemCount: productList.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 0.70),
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
  final Color inactiveColor = Colors.black38;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView( 
      
      child: Column(
       
      children: [
        
        Container(
          height: 200,
          width: 152,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: primarycolor,
          ),
          child: Image.asset(widget.recent_single_product_image),
        ),
        ListTile(
            title: Text(widget.recent_single_product_name),
            subtitle: Text(widget.recent_single_product_price),
            // we use trailing widget to create favorite
            trailing: Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                  color: primarycolor, borderRadius: BorderRadius.circular(30)),
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
    ));
  }
}
