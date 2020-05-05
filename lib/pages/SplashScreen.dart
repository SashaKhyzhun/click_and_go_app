import 'dart:async';

import 'package:clickandgoapp/pages/AuthPage.dart';
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

    performAction();
  }

  Future performAction() {
    return Future.delayed(const Duration(seconds: 2), () {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => AuthPage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/splash_background.jpg'),
              fit: BoxFit.fill),
        ),
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: Center(
                  child: Container(
                margin: EdgeInsets.all(64),
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/splash_icon.png'),
                      fit: BoxFit.scaleDown),
                ),
              )),
            ),
            Expanded(
              flex: 2,
              child: Container(),
            )
          ],
        ));
  }
}
