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
        color: Colors.tealAccent,
        child: Container(
          height: 75,
          margin: EdgeInsets.fromLTRB(16, 8, 16, 8),
          decoration: new BoxDecoration(
            color: Colors.blueAccent,
            borderRadius: new BorderRadius.all(const Radius.circular(16.0))
          ),
          padding: EdgeInsets.fromLTRB(0, 8, 0, 8),
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Padding(
                  padding: EdgeInsets.all(0.0),
                )
              ),
              Expanded(
                flex: 3,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        widget.item.price.toString(),
                        textAlign: TextAlign.justify,
                        maxLines: 1,
                        style: TextStyle(
                          fontSize: 15.0,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        )
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 4.0),
                        child: Text(
                          widget.item.title,
                          textAlign: TextAlign.justify,
                          maxLines: 1,
                          style: TextStyle(
                            fontSize: 12.0,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.normal,
                            color: Colors.white
                          ),
                        )
                      ),
                    ],
                  ),
                )
              ),
              Expanded(
                flex: 1,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 14,
                        color: Colors.white
                      ),
                    ],
                  )
                )
              )
            ],
          )
        ),
      ),
    );
  }
}
