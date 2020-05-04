import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 8,
            child: Column(
              children: <Widget>[
                Text("qwerty"),
                Text("qwerty"),
                Text("qwerty"),
                Text("qwerty"),
                Text("qwerty"),
                Text("qwerty")
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              color: Colors.green,
            ),
          )
        ],
      ),
    );
  }
}
