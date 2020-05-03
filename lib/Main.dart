import 'package:clickandgoapp/data/models/ShoppingItem.dart';
import 'package:clickandgoapp/data/repository/ShoppingRepository.dart';
import 'package:flutter/material.dart';
import 'controllers/MainBottonNavController.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class AppState with ChangeNotifier {

  ShoppingRepository shoppingCartRepository;
  double _totalPrice;
  int _totalAmount;

  AppState() {
    this.shoppingCartRepository = ShoppingRepository();
    this._totalPrice = shoppingCartRepository.getTotal();
    this._totalAmount = shoppingCartRepository.getTotalElements();
  }

  get totalPrice => _totalPrice;
  get totalAmount => _totalAmount;

  set totalPrice(double val) => _totalPrice = val;
  set totalAmount(int val) => _totalAmount = val;

  void saveItem(ShoppingItem item) {
    this.shoppingCartRepository.save(item);
    this.totalPrice = this.shoppingCartRepository.getTotal();
    this.totalAmount = this.shoppingCartRepository.getTotalElements();
  }

  void clearItems() {
    this.shoppingCartRepository.deleteAll();
    this.totalPrice = this.shoppingCartRepository.getTotal();
    this.totalAmount = this.shoppingCartRepository.getTotalElements();
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

