import 'package:flutter/material.dart';
import 'constants.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                          //shadow color
                          color: Colors.black38,
                          blurRadius: 4)
                    ],
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      //remove bar
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                      prefixIcon: Icon(Icons.search),
                    ),
                  )),
            ),
            //sorting botton
            SizedBox(
              width: 10,
            ),
            Container(
              decoration: BoxDecoration(
                  color: primarycolor,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [BoxShadow(color: Colors.black38, blurRadius: 4)]),
              child:
                  IconButton(onPressed: () {}, icon: Icon(Icons.sort_by_alpha)),
            )
          ],
        )
      ],
    );
  }
}
