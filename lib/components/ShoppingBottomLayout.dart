import 'dart:ffi';

import 'package:clickandgoapp/data/models/ShoppingItem.dart';
import 'package:clickandgoapp/data/repository/ShoppingRepository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShoppingBottomLayout extends StatefulWidget {

  ShoppingBottomLayout({
    this.price
  });

  final double price;

  @override
  _ShoppingBottomLayoutState createState() => _ShoppingBottomLayoutState();
}

class _ShoppingBottomLayoutState extends State<ShoppingBottomLayout> {

  ShoppingRepository repository = ShoppingRepository();

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
              color: Colors.white
            ),
          ),


          new StreamBuilder(
            stream: repository.subject,
            builder: (context, AsyncSnapshot<List<ShoppingItem>> snapshot){
            return new Padding(
              padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
              child: Text(
                '${snapshot.data.map((f) => {
                  f.price
                })}',

                textAlign: TextAlign.end,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.white
                ),
              ),
            );
          }),

        ],
      ),
    );
  }

}
