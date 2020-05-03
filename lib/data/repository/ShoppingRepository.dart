
import 'package:clickandgoapp/data/models/ShoppingItem.dart';

class ShoppingRepository {

  /*
   * Singleton
   */

  static final ShoppingRepository _singleton = ShoppingRepository._internal();

  factory ShoppingRepository() {
    return _singleton;
  }

  ShoppingRepository._internal();

  var data = List<ShoppingItem>();
  /*
   * Control the data
   */

  save(ShoppingItem item) {
    data.add(item);
  }

  List<ShoppingItem> getAll() {
    return data;
  }

  deleteAll() {
    data.clear();
  }

}