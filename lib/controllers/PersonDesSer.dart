
import 'package:clickandgoapp/data/models/ShoppingItem.dart';
import 'package:pref_dessert/pref_dessert.dart';

class ShoppingItemDesSer extends DesSer<ShoppingItem>{

  @override
  ShoppingItem deserialize(String s) {
    var split = s.split(",");
    return new ShoppingItem(
      id: int.parse(split[0]),
      title: split[1],
      price: double.parse(split[2]),
      amount: int.parse(split[3]),
      totalPrice: double.parse(split[4])
    );
  }

  @override
  String serialize(ShoppingItem t) {
    return "${t.id},${t.title},${t.price},${t.amount},${t.totalPrice}";
  }

  @override
  String get key => null;

}

//void main() {
//  var repo = new FuturePreferencesRepository<ShoppingItem>(new PersonDesSer());
//  repo.save(new ShoppingItem("Foo", 42));
//  repo.save(new ShoppingItem("Bar", 1));
//  var list = repo.findAll();
