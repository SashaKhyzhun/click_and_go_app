import 'package:flutter/material.dart';

class ShoppingItem {

  ShoppingItem({
    this.id,
    this.title,
    this.price,
    this.amount,
    this.totalPrice
  });

  int id;
  String title;
  double price;
  int amount;
  double totalPrice;

  static List<ShoppingItem> mockShoppingList = <ShoppingItem>[
    ShoppingItem(
      id: 0,
      title: 'Молоко',
      price: 33.00,
      amount: 1,
      totalPrice: 33.00
    ),
    ShoppingItem(
      id: 0,
      title: 'Сыр',
      price: 55.00,
      amount: 1,
      totalPrice: 55.00
    ),
    ShoppingItem(
      id: 0,
      title: 'Хлеб',
      price: 45.00,
      amount: 1,
      totalPrice: 45.00
    ),
    ShoppingItem(
      id: 0,
      title: 'Колбаса',
      price: 85.00,
      amount: 1,
      totalPrice: 85.00
    ),


  ];

}
