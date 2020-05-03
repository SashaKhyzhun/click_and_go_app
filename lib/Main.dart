import 'package:clickandgoapp/data/models/ShoppingItem.dart';
import 'package:clickandgoapp/data/repository/ShoppingRepository.dart';
import 'package:flutter/material.dart';
import 'controllers/MainBottonNavController.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class AppState with ChangeNotifier {

  ShoppingRepository shoppingCartRepository;
  double _total;

  AppState() {
    this.shoppingCartRepository = ShoppingRepository();
    this._total = shoppingCartRepository.getTotal();
  }

  get total => _total;

  set total(double val) => _total = val;

  void saveItem(ShoppingItem item) {
    this.shoppingCartRepository.save(item);
    this.total = this.shoppingCartRepository.getTotal();
  }
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AppState(),
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomeBottomNavigationController(),
      ),
    );
  }
}

