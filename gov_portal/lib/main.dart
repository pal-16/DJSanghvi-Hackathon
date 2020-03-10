import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'screens/login.dart';
import 'screens/signup.dart';
import 'screens/home.dart';

void main() {
  runApp(TernaApp());
}

class TernaApp extends StatefulWidget{

  @override
  _TernaAppState createState() => _TernaAppState();
}

class _TernaAppState extends State<TernaApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Terna App",
      theme: ThemeData(
        primaryColor: Color.fromRGBO(191, 229, 255, 1),
        accentColor: Colors.greenAccent,
        backgroundColor: Colors.white,
        bottomAppBarColor: Colors.white,
      ),
       routes: {
        Home.routeName:(ctx) => Home(),
        Signup.routeName:(ctx) =>Signup(),
        Login.routeName:(ctx) =>Login(),

    },
   home:Login() ,
    );
  }
}
