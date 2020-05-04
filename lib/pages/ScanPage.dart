import 'dart:math';

import 'package:barcode_scan/barcode_scan.dart';
import 'package:clickandgoapp/components/ShoppingBottomLayout.dart';
import 'package:clickandgoapp/data/models/ShoppingItem.dart';
import 'package:clickandgoapp/pages/DrawerOverlay.dart';
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
              onTap: ()  {
//                Navigator.push(
//                  context,
//                  MaterialPageRoute(builder: (context) => MyDrawer()),
//                )

                Navigator.of(context).push(DrawerOverlay());
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
                                      setState(() {
                                        appState.changeBottomPage(1);
                                              appState.saveItem(
                                                  _getRandomShoppingElement());
                                      });
//                                      scan().then((value) => {
//                                            setState(() {
//                                              appState.saveItem(
//                                                  _getRandomShoppingElement());
//                                            })
//                                          });
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