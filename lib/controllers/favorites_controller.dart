import 'package:afnozamin/helpers.dart';
import 'package:afnozamin/model/product.dart';
import 'package:flutter/cupertino.dart';

class FavoriteController with ChangeNotifier {
  List<Product> all = [];

  FavoriteController();

  void add(Product p) {
    if (!all.contains(p)) {
      all.add(p);
    }
    notifyListeners();
    like(p.id);
  }

  void remove(Product p) {
    all.remove(p);
    notifyListeners();
  }

  bool isFav(Product p) {
    return all.contains(p);
  }
}
