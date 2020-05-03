import 'package:clickandgoapp/data/models/ShoppingItem.dart';
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

  final subject = BehaviorSubject<List<ShoppingItem>>();

  /*
   * Control the data
   */

  save(ShoppingItem item) {
    var previous = List<ShoppingItem>();
    print("save | previous before = ${previous.length}");
    subject.map((m) => {
      previous.addAll(m)
    });
    print("save | previous after  = ${previous.length}");
    previous.add(item);
    print("save | previous + 1    = ${previous.length}");
    subject.add(previous);

  }

  deleteAll() {
    subject.map((m) => {
      m.clear()
    });
  }

}