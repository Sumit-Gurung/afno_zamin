import 'package:afnozamin/pages/constants.dart';
import 'package:flutter/material.dart';

class Notificaionview extends StatelessWidget {
  const Notificaionview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
      ),
      body: Listview(),
    );
  }
}

Widget Listview() {
  return ListView.separated(
      itemBuilder: (context, index) {
        return ListviewItem(index);
      },
      separatorBuilder: (context, index) {
        return Divider(height: 1);
      },
      itemCount: 3);
}

Widget ListviewItem(int index) {
  return Container(
      margin: EdgeInsets.symmetric(horizontal: 13, vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PrefixIcon(),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  message(index),
                  timeanddate(
                    index,
                  )
                ],
              ),
            ),
          ),
        ],
      ));
}

Widget PrefixIcon() {
  return Container(
    height: 50,
    width: 50,
    padding: EdgeInsets.all(10),
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: Colors.grey.shade300,
    ),
    child: Icon(
      Icons.notifications,
      size: 25,
      color: Colors.grey.shade700,
    ),
  );
}

Widget message(int index) {
  double textsize = 14;
  return Container(
    child: RichText(
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(
          text: 'Hey! DEF ',
          style: TextStyle(
            fontSize: textsize,
            color: primarycolor,
            fontWeight: FontWeight.bold,
          ),
          children: [
            TextSpan(
                text: 'ABC liked your property',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                ))
          ]),
    ),
  );
}

Widget timeanddate(int index) {
  return Container(
    margin: EdgeInsets.only(top: 5),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '23-09-2001',
          style: TextStyle(fontSize: 10),
        ),
        Text(
          '10:25',
          style: TextStyle(fontSize: 10),
        )
      ],
    ),
  );
}
