import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gov_portal/select_scheme.dart';

import '../widgets/app_drawer.dart';

class Home extends StatefulWidget {
  static const routeName = '/home';

  @override
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<Home> {
  
  @override
  initState() {
    super.initState();
  }

  final appBar = AppBar(
    title: Text(
      "Scan",
      style: TextStyle(color: Colors.white),
    ),
    backgroundColor: Color.fromRGBO(143, 148, 251, 1),
  );

  void select(){
    Navigator.of(context).pushNamed(SchemeList.routeName,arguments: {
      'appbar' : appBar,
    });
  }



  @override
  Widget build(BuildContext context) {


    return Scaffold(
        drawer: AppDrawer(appBar),
        appBar: appBar,
        body: new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                    child: const Text('this screen apperas after logging and signup')),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Text('hello',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 25),
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: RaisedButton(
                  color: Color.fromRGBO(143, 148, 251, 1),
                  onPressed: select,
                  child: Text("daalo apne forms"),
                ),
              )
            ],
          ),
        ));
  }

}