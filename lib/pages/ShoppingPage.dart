import 'package:clickandgoapp/Main.dart';
import 'package:clickandgoapp/components/ShoppingBottomLayout.dart';
import 'package:clickandgoapp/components/SliverShoppingListItem.dart';
import 'package:clickandgoapp/data/models/ShoppingItem.dart';
import 'package:clickandgoapp/pages/MyDrawer.dart';
import 'package:clickandgoapp/pages/PaymentsPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class ShoppingPage extends StatefulWidget {
  @override
  _ShoppingPageState createState() => new _ShoppingPageState();
}

class _ShoppingPageState extends State<ShoppingPage> {
  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);
    var titlePlural = "Товаров";

    if (appState.totalAmount == 1) {
      titlePlural = "товар";
    } else {
      titlePlural = "товаров(ов)";
    }

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
            InkWell(
              onTap: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyDrawer()),
                )
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
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                flex: 11,
                child: CustomScrollView(
                  slivers: <Widget>[
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(0, 8, 0, 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            Text(
                              "В корзине ${appState.totalAmount} $titlePlural",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                            ),
                            Material(
                              color: Colors.transparent,
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    appState.clearItems();
                                  });
                                },
                                splashColor: Colors.teal,
                                child: Container(
                                  padding: EdgeInsets.fromLTRB(16, 8, 0, 8),
                                  child: Center(
                                    child: Icon(
                                      Icons.delete,
                                      size: 28,
                                      color: Colors.blueAccent,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    getSliverShoppingItems(
                      appState.shoppingCartRepository.data),
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(0, 8, 24, 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Text(
                              "сумма: ",
                              style: TextStyle(
                                color: Colors.black, fontSize: 22),
                            ),
                            Text(
                              "\$${appState.totalPrice.toStringAsFixed(2)}",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 22,
                                fontWeight: FontWeight.bold
                              ),
                            )
                          ],
                        ),
                      )),
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(48, 8, 48, 8),
                        child: Container(
                          color: Colors.blueAccent,
                          child: InkWell(
                            onTap: () => {
//                              Navigator.push(
//                                context,
//                                MaterialPageRoute(builder: (context) => MyDrawer()),
//                              )
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.fromLTRB(16, 8, 8, 8),
                                  child: Text(
                                    "ПЕРЕЙТИ К ОПЛАТЕ",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.fromLTRB(8, 8, 16, 8),
                                  child: Center(
                                    child: Icon(
                                      Icons.credit_card,
                                      size: 21,
                                      color: Colors.white,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),

                      )),
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

Widget getSliverShoppingItems(List<ShoppingItem> events) {
  var listOfSlivers = List<Widget>();
  events.forEach((f) => listOfSlivers.add(SliverShoppingListItem(item: f)));
  return SliverList(
    delegate: SliverChildListDelegate(listOfSlivers),
  );
}
