import 'dart:math';

import 'package:barcode_scan/barcode_scan.dart';
import 'package:clickandgoapp/components/ShoppingBottomLayout.dart';
import 'package:clickandgoapp/data/models/ShoppingItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../Main.dart';

class ScanPage extends StatefulWidget {
  @override
  _ScanPageState createState() => new _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  String barcode = "";

  @override
  void initState() {
    super.initState();
  }

  Future scan() async {
    try {
      var barcode = await BarcodeScanner.scan();
      setState(() {
        this.barcode = barcode.rawContent;
        print("code=${this.barcode}");
      });
    } on PlatformException catch (e) {
      if (e.code == BarcodeScanner.cameraAccessDenied) {
        setState(() {
          this.barcode = 'Camera Permission not granted';
        });
      } else {
        setState(() {
          this.barcode = 'Unkown error: $e';
        });
      }
    } on FormatException {
      setState(() {
        this.barcode =
            'null (User returned using the "back"-button before scanning anything, Result)';
      });
    } catch (e) {
      setState(() {
        this.barcode = 'Unkown error: $e';
      });
    }
  }

  void _showOverlay(BuildContext context) {
    Navigator.of(context).push(TutorialOverlay());
  }

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
              "Click&Go | Сканировать",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            InkWell(
              onTap: () => {
//                Navigator.push(
//                  context,
//                  MaterialPageRoute(builder: (context) => MyDrawer()),
//                )

                _showOverlay(context),
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
                        "Нажмите,\nчтобы отсканировать\nкод продукта",
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
                                      scan().then((value) => {
                                            setState(() {
                                              appState.saveItem(
                                                  _getRandomShoppingElement());
                                            })
                                          });
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
                            ]),
                      ),
                    ],
                  ),
                ),
                Expanded(flex: 1, child: ShoppingBottomLayout(price: 0.0)),
              ],
            )),
      ),
    );
  }
}

ShoppingItem _getRandomShoppingElement() {
  var list = ShoppingItem.mockShoppingList;
  final _random = new Random();
  return list[_random.nextInt(list.length)];
}


class TutorialOverlay extends ModalRoute<void> {
  @override
  Duration get transitionDuration => Duration(milliseconds: 250);

  @override
  bool get opaque => false;

  @override
  bool get barrierDismissible => false;

  @override
  Color get barrierColor => Colors.black.withOpacity(0.7);

  @override
  String get barrierLabel => null;

  @override
  bool get maintainState => true;

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    ) {
    // This makes sure that text and other content follows the material style
    return Material(
      type: MaterialType.transparency,
      // make sure that the overlay content is not cut off
      child: SafeArea(
        child: _buildOverlayContent(context),
      ),
    );
  }

  Widget _buildOverlayContent(BuildContext context) {
    return Center(
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 8,
            child: Container(
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(16, 16, 16, 16),
                    child: Text(
                      "Click&Go | Меню",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 15
                      ),
                    ),
                  ),
                  Column(
                    children: <Widget>[
                      Container(
                        child: InkWell(
                          onTap: () => { print("clicked 1")},
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.fromLTRB(16, 32, 32, 32),
                                child: Icon(Icons.crop_free),
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text("Сканировать код",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold
                                    ),
                                  ),
                                  Text("Сканер кодов продуктов",
                                    style: TextStyle(
                                      color: Colors.grey[600],
                                      fontSize: 15,
                                      fontWeight: FontWeight.normal
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        child: InkWell(
                          onTap: () => { print("clicked 2")},
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.fromLTRB(16, 32, 32, 32),
                                child: Icon(Icons.shopping_cart),
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text("Корзина",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold
                                    ),
                                  ),
                                  Text("Список ваших продуктов",
                                    style: TextStyle(
                                      color: Colors.grey[600],
                                      fontSize: 15,
                                      fontWeight: FontWeight.normal
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        child: InkWell(
                          onTap: () => { print("clicked 3")},
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.fromLTRB(16, 32, 32, 32),
                                child: Icon(Icons.credit_card),
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text("Оплата",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold
                                    ),
                                  ),
                                  Text("Оплата ваших покупок",
                                    style: TextStyle(
                                      color: Colors.grey[600],
                                      fontSize: 15,
                                      fontWeight: FontWeight.normal
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        child: InkWell(
                          onTap: () => { print("clicked 4")},
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.fromLTRB(16, 32, 32, 32),
                                child: Icon(Icons.help),
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text("Помощь",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold
                                    ),
                                  ),
                                  Text("Дополнительная информация",
                                    style: TextStyle(
                                      color: Colors.grey[600],
                                      fontSize: 15,
                                      fontWeight: FontWeight.normal
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              )
            ),
          ),
          Expanded(
            flex: 2,
            child: InkWell(
              onTap: () => {
                Navigator.pop(context)
              },
              child: Container(
                color: Colors.transparent,
              ),
          )
          )
        ],
      ),
    );
  }

  @override
  Widget buildTransitions(
    BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
    // You can add your own animations for the overlay content
    Animation<Offset> custom = Tween<Offset>(begin: Offset(-1.0, 0.0), end: Offset(0.0, 0.0)).animate(animation);
    return SlideTransition(
      position: custom,
      child: child,
    );
  }
}