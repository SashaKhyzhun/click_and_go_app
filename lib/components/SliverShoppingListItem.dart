import 'package:clickandgoapp/data/models/ShoppingItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SliverShoppingListItem extends StatefulWidget {

  final ShoppingItem item;

  SliverShoppingListItem({
    this.item
  });

  @override
  _SliverShoppingListItemState createState() =>
    new _SliverShoppingListItemState();
}

class _SliverShoppingListItemState extends State<SliverShoppingListItem> {
  @override
  Widget build(BuildContext context) {
    return new InkWell(
      onTap: () {},
      child: Container(
        child: Container(
          margin: EdgeInsets.fromLTRB(16, 0, 16, 0),
          decoration: myBoxDecoration(),
          padding: EdgeInsets.fromLTRB(8, 16, 8, 16),
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 7,
                child: Text(
                  widget.item.title,
                  style: TextStyle(color: Colors.black),
                )
              ),
              Expanded(
                flex: 2,
                child: Text(widget.item.price.toString())
              ),
              Expanded(
                flex: 1,
                child: Text(widget.item.amount.toString())
              ),
              Expanded(
                flex: 2,
                child: Text(
                  widget.item.totalPrice.toStringAsFixed(2),
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              ),
            ],
          )
        ),
      ),
    );
  }
}

BoxDecoration myBoxDecoration() {
  return BoxDecoration(
    border: Border.all(
      width: 1.0,
      color: Colors.grey
    ),
    borderRadius: BorderRadius.all(
      Radius.zero
    ),
  );
}
