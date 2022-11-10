import 'package:afnozamin/model/product.dart';
import 'package:afnozamin/pages/constants.dart';
import 'package:afnozamin/pages/ename.dart';
import 'package:afnozamin/pages/favorite_button.dart';
// import 'package:afnozamin/pages/search_bar.dart';
import 'package:afnozamin/pages/slider/slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

// import 'package:url_launcher/url_launcher.dart';

import 'BottomBar.dart';
// import 'Custom_appbar.dart';

class IndividualPage extends StatefulWidget {
  final Product product;

  IndividualPage({Key? key, required this.product});

  @override
  State<IndividualPage> createState() => _IndividualPageState();
}

class _IndividualPageState extends State<IndividualPage> {
  bool islike = false;
  final Color inactiveColor = Colors.white;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Property Detail'),
      ),
      bottomNavigationBar: BottomNavBar(
        selectedMenu: MenuState.userprofile,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          String toCall = "009779814117721";
          if (widget.product.uploader != null) {
            toCall = widget.product.uploader!.phoneNumber;
          }
          await FlutterPhoneDirectCaller.callNumber(toCall);
        },
        child: Icon(Icons.phone),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.only(left: 10, right: 10),
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(widget.product.image),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                horizontal: 20.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.product.title,
                            style: TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Rs.${widget.product.price}",
                            style: TextStyle(
                              color: primarycolor,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      FavoriteButton(product: widget.product),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      DetailCard(
                          icon: Icons.location_city,
                          text: widget.product.location),
                      DetailCard(
                          icon: Icons.category, text: widget.product.purpose),
                      DetailCard(
                          icon: Icons.area_chart,
                          text: "${widget.product.area}"),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 20,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Description',
                          style: TextStyle(
                            color: primarycolor,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          widget.product.description,
                          style: TextStyle(
                            color: Color.fromARGB(255, 95, 95, 95),
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ),
                  if (widget.product.uploader != null)
                    Column(
                      children: [
                        Text(
                          'Owner details',
                          style: TextStyle(
                            color: primarycolor,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  'Uploaded by : ${widget.product.uploader!.username}'),
                              Text('Email : ${widget.product.uploader!.email}'),
                              Text(
                                  'Phone No : ${widget.product.uploader!.phoneNumber}'),
                            ],
                          ),
                        ),
                      ],
                    ),
                ], //children
              ),
            )
          ],
        ),
      ),
    );
  }
}

class DetailCard extends StatelessWidget {
  final IconData icon;
  final String text;

  const DetailCard({Key? key, required this.icon, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 110,
        height: 110,
        padding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 40,
              color: primarycolor,
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              text,
              style: TextStyle(
                color: Color.fromARGB(255, 95, 95, 95),
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ));
  }
}
