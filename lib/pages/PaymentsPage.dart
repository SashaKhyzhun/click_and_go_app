import 'package:clickandgoapp/components/ShoppingBottomLayout.dart';
import 'package:clickandgoapp/pages/DrawerOverlay.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../Main.dart';

class PaymentsPage extends StatefulWidget {
  @override
  _PaymentsPageState createState() => new _PaymentsPageState();
}

class _PaymentsPageState extends State<PaymentsPage> {

  @override
  Widget build(BuildContext context) {

    final appState = Provider.of<AppState>(context);

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
              "Click&Go | Оплата",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            InkWell(
              onTap: () => {
                Navigator.of(context).push(DrawerOverlay())
              },
              child: Icon(
                Icons.menu,
                color: Colors.white,
              ),
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
                      Text(
                        "Нажмите,\nчтобы оплатить",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 32),
                        child: Stack(
                          alignment: Alignment.center,
                          children: <Widget>[
                            Container(
                              width: 100,
                              height: 100,
                              child: Material(
                                color: Colors.teal,
                                borderRadius: BorderRadius.circular(90),
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      appState.clearItems();
                                    });
                                  },
                                  borderRadius: BorderRadius.circular(90),
                                  splashColor: Colors.teal,
                                  child: Container(
                                    height: 50,
                                    width: 150,
                                    child: Center(
                                      child: Icon(Icons.payment,
                                        size: 60, color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ]),
                      ),
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
