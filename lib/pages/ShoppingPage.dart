import 'package:clickandgoapp/components/ShoppingBottomLayout.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ShoppingPage extends StatefulWidget {
  @override
  _ShoppingPageState createState() => new _ShoppingPageState();
}

class _ShoppingPageState extends State<ShoppingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              "Click&Go | Корзина",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            Icon(
              Icons.menu,
              color: Colors.white,
            )
          ],
        ),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Expanded(
                  flex: 11,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        width: 100,
                        height: 100,
                        child: Material(
                          color: Colors.teal,
                          borderRadius: BorderRadius.circular(90),
                          child: InkWell(
                            onTap: () {
                              //_showSavedItems();
                            },
                            borderRadius: BorderRadius.circular(90),
                            splashColor: Colors.teal,
                            child: Container(
                              height: 50,
                              width: 150,
                              child: Center(
                                child: Icon(Icons.crop_free,
                                  size: 60, color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(flex: 1, child: ShoppingBottomLayout(price: 0.0))
              ],
            )),
      ),
    );
  }
}