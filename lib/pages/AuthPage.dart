import 'package:clickandgoapp/controllers/MainBottonNavController.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AuthPage extends StatefulWidget {
  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: Container(

        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 200,
              height: 100,
              margin: EdgeInsets.only(bottom: 64),
              child: Image(
                image: AssetImage("assets/splash_icon.png"),
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 32, right: 32),
              child: createEmailEditText(context),
            ),
            Padding(
              padding: EdgeInsets.only(left: 32, right: 32),
              child: createDescriptionEditText(context),
            ),
            Container(
              margin: EdgeInsets.only(top: 32),
              child: RaisedButton(
                color: Colors.teal,
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => HomeBottomNavigationController()));
                },
                child: Container(
                  child: Text("Войти в систему", style: TextStyle(color: Colors.white),),
                ),
              ),
            )
          ],
        ),
      )
    );
  }
}

Widget createEmailEditText(
    //TextEditingController emailController,
    BuildContext context) {
  return Container(
    child: TextField(
      //controller: emailController,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.done,
      onSubmitted: (_) => {FocusScope.of(context).unfocus()},
      decoration: InputDecoration(
        hintText: 'Введите почту',
        hintStyle: TextStyle(fontSize: 16.0, color: Colors.grey),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
      ),
      style: TextStyle(
        color: Colors.black,
        fontStyle: FontStyle.normal,
        fontSize: 16.0,
        fontWeight: FontWeight.normal,
      ),
      maxLines: 1,
      textCapitalization: TextCapitalization.none,
      textAlign: TextAlign.center,
      cursorColor: Colors.grey,
      enableSuggestions: false,
    ),
  );
}

Widget createDescriptionEditText(
    //TextEditingController emailController,
    BuildContext context) {
  return TextField(
    //controller: emailController,
    keyboardType: TextInputType.visiblePassword,
    textInputAction: TextInputAction.done,
    onSubmitted: (_) => {FocusScope.of(context).unfocus()},
    decoration: InputDecoration(
      hintText: 'Введите пароль',
      hintStyle: TextStyle(fontSize: 16.0, color: Colors.grey),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.grey),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.black),
      ),
    ),
    style: TextStyle(
      color: Colors.black,
      fontStyle: FontStyle.normal,
      fontSize: 16.0,
      fontWeight: FontWeight.normal,
    ),
    maxLines: 1,
    obscureText: true,
    textCapitalization: TextCapitalization.none,
    textAlign: TextAlign.center,
    cursorColor: Colors.grey,
    enableSuggestions: false,
  );
}
