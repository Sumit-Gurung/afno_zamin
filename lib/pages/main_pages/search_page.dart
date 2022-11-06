import 'package:afnozamin/pages/ename.dart';
import 'package:flutter/material.dart';

import '../BottomBar.dart';

class DataSearch extends SearchDelegate<String> {
  final Prop = [
    'fubari',
    'lamachaur',
    'bagar',
    'mahendrapool',
    'ranibari',
    'lazim'
  ];
  final RecentProp = ['fubari', 'lamachaur', 'bagar'];
  @override
  List<Widget>? buildActions(BuildContext context) {
    // action for app bar
    return [
      IconButton(
          onPressed: () {
            query = "";
          },
          icon: Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // leading icons
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () => Navigator.pop(context),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // show result best on selections

    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // show suggestions
    final suggestionList = query.isEmpty
        ? RecentProp
        : Prop.where((p) => p.startsWith(query)).toList();

    return ListView.builder(
        itemBuilder: (context, index) => ListTile(
            leading: Icon(Icons.location_city),
            title: RichText(
                text: TextSpan(
                    text: suggestionList[index].substring(0, query.length),
                    style: TextStyle(
                        color: Colors.greenAccent, fontWeight: FontWeight.bold),
                    children: [
                  TextSpan(
                      text: suggestionList[index].substring(query.length),
                      style: TextStyle(color: Colors.grey))
                ])) //Text(suggestionList[index]),
            ),
        itemCount: suggestionList.length);
  }
}
