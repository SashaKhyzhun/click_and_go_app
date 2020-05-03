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

  ShoppingItem.fromJson(Map<String, dynamic> json)
    : id = json['id'],
      title = json['title'],
      price = json['price'],
      amount = json['amount'],
      totalPrice = json['totalPrice'];


  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'price': price,
    'amount': amount,
    'totalPrice': totalPrice
  };

}
