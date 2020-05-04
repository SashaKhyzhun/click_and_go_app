import 'dart:async';

import 'package:clickandgoapp/Main.dart';
import 'package:clickandgoapp/pages/PaymentsPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SplashScreen extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return SplashScreenState();
  }
}

class SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();

    loadData();
  }

  Future<Timer> loadData() async {
    return new Timer(Duration(seconds: 2), onDoneLoading);
  }

  onDoneLoading() async {
    Builder(
      builder: (context) => Center(
        child: RaisedButton(
          child: Text("Foo"),
          onPressed: () =>  Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => PaymentsPage())
          ),
        ),
      ),
    );

  }


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/splash_background.jpg'),
          fit: BoxFit.fill
        ) ,
      ),
      child: Center(
        child: Container(
          margin: EdgeInsets.all(64),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/splash_icon.jpg'),
              fit: BoxFit.scaleDown
            ),
          ),
        )
      )
    );
  }
}