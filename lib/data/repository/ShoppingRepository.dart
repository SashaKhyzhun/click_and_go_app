import 'package:clickandgoapp/data/models/ShoppingItem.dart';
import 'package:flutter/foundation.dart';
import 'package:rxdart/rxdart.dart';

class ShoppingRepository {

  /*
   * Singleton
   */

  static final ShoppingRepository _singleton = ShoppingRepository._internal();

  factory ShoppingRepository() {
    return _singleton;
  }

  ShoppingRepository._internal();

  final data = List<ShoppingItem>();

  /*
   * Control the data
   */

  List<ShoppingItem> getAll() {
    return data;
  }

  save(ShoppingItem item) {
    data.add(item);
  }

  deleteAll() {
    data.clear();
  }


}