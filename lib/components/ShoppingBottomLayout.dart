import 'package:clickandgoapp/data/repository/ShoppingRepository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Main.dart';
import 'package:provider/provider.dart';


class ShoppingBottomLayout extends StatefulWidget {
  ShoppingBottomLayout({this.price});

  final double price;

  @override
  State<StatefulWidget> createState() {
    ShoppingBottomLayoutState state = ShoppingBottomLayoutState();
    return state;
  }

}

class ShoppingBottomLayoutState extends State<ShoppingBottomLayout> {

  @override
  Widget build(BuildContext context) {
    double price = Provider.of<AppState>(context).total;
    final appState = Provider.of<AppState>(context);

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
              "\$${appState.total.toStringAsFixed(2)}",
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
