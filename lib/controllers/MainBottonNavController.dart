import 'package:clickandgoapp/pages/PaymentsPage.dart';
import 'package:clickandgoapp/pages/ScanPage.dart';
import 'package:clickandgoapp/pages/ShoppingPage.dart';
import 'package:flutter/material.dart';

class HomeBottomNavigationController extends StatefulWidget {
  @override
  _HomeBottomNavigationControllerState createState() =>
      _HomeBottomNavigationControllerState();
}

class _HomeBottomNavigationControllerState extends State<HomeBottomNavigationController> {
  final List<Widget> pages = [
    ScanPage(),
    ShoppingPage(),
    PaymentsPage(),
  ];

  final PageStorageBucket bucket = PageStorageBucket();

  int _selectedIndex = 0;

  Widget _bottomNavigationBar(int selectedIndex) => BottomNavigationBar(
    onTap: (int index) { setState(() => _selectedIndex = index); },
    currentIndex: selectedIndex,
    backgroundColor: Colors.blueAccent,
    type: BottomNavigationBarType.fixed,
    selectedItemColor: Colors.white,
    elevation: 0,
    selectedLabelStyle: TextStyle(
      fontWeight: FontWeight.bold,
      fontStyle: FontStyle.normal,
    ),
    unselectedItemColor: Colors.white,
    unselectedLabelStyle: TextStyle(
      fontWeight: FontWeight.normal,
      fontStyle: FontStyle.normal,
    ),
    showUnselectedLabels: true,
    items: <BottomNavigationBarItem>[
      BottomNavigationBarItem(
          icon: Icon(Icons.crop_free),
          title: Text('Сканировать')
      ),
      BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart),
          title: Text('Корзина')
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.credit_card),
        title: Text('Оплата')
      ),
    ],
  );


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _bottomNavigationBar(_selectedIndex),
      body: PageStorage(
        bucket: bucket,
        child: pages[_selectedIndex],
      ),
    );
  }
}
