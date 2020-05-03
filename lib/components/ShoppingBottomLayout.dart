import 'package:clickandgoapp/data/repository/ShoppingRepository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShoppingBottomLayout extends StatefulWidget {
  ShoppingBottomLayout({this.price});

  final double price;

  @override
  _ShoppingBottomLayoutState createState() => _ShoppingBottomLayoutState();
}

class _ShoppingBottomLayoutState extends State<ShoppingBottomLayout> {
  ShoppingRepository repository = ShoppingRepository();
  var total = 0.0;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.blueAccent,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Text(
            "Товаров на сумму:",
            textAlign: TextAlign.end,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.normal,
                color: Colors.white),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
            child: Text(
              "${repository.getAll().map((f) => {
                total = 0.0,
                total += f.price
              }).map((f) => {
                total
              })}",
              textAlign: TextAlign.end,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
