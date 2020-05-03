
import 'package:clickandgoapp/data/models/ShoppingItem.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:rxdart/rxdart.dart';
import 'package:provider/provider.dart';

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
  
  double getTotal() {
    return data.map((f){return f.price;}).fold(0.0, (previous, current) => previous + current);
  }

  int getTotalElements() {
    return data.length;
  }

  save(ShoppingItem item) {
    data.add(item);
  }

  deleteAll() {
    data.clear();
  }


}