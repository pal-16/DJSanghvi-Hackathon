import 'package:flutter/material.dart';
import '../screens/signup.dart';
import '../Animation/FadeAnimation.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../screens/home.dart';


/*void load(bool logged) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  logged = prefs.getBool('logged') ?? false;
}*/

class Login extends StatefulWidget {
   static const routeName = '/login';

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String username, password;
  final TextEditingController _usernameController = new TextEditingController();
  final TextEditingController _passwordController = new TextEditingController();

  void _saveForm() async {
    print("done");
    username = _usernameController.text;
    password = _passwordController.text;

    if (!username.contains("@")) {
      _usernameController.text = "";
      _passwordController.text = "";
      print("email incorrect");
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text(
            "Invalid Email format",
            style: TextStyle(fontFamily: 'Aleo', fontWeight: FontWeight.bold),
          ),
          content: Text("Email does not contain @"),
          actions: <Widget>[
            FlatButton(
              child: Text("Okay",
                  style: TextStyle(
                      fontFamily: 'Aleo', fontWeight: FontWeight.bold)),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        ),
      );
    } else if (password.length < 8) {
      _usernameController.text = "";
      _passwordController.text = "";
      print("password should be minimum 8 chars");
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text(
            "Password too short",
            style: TextStyle(fontFamily: 'Aleo', fontWeight: FontWeight.bold),
          ),
          content: Text("Password should be minimum 8 characters"),
          actions: <Widget>[
            FlatButton(
              child: Text("Okay",
                  style: TextStyle(
                      fontFamily: 'Aleo', fontWeight: FontWeight.bold)),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        ),
      );
    } else {
      if (_usernameController.text == 'admin' &&
          _passwordController.text == '123') {
        Navigator.of(context).pushReplacementNamed(Home.routeName);
      } else {
        showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: Text(
              "Incorrect",
              style: TextStyle(fontFamily: 'Aleo', fontWeight: FontWeight.bold),
            ),
            content: Text("Incorrect Credentials"),
            actions: <Widget>[
              FlatButton(
                child: Text("Okay",
                    style: TextStyle(
                        fontFamily: 'Aleo', fontWeight: FontWeight.bold)),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                Container(
                  height: 400,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/background.png'),
                          fit: BoxFit.fill)),
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        left: 30,
                        width: 80,
                        height: 200,
                        child: FadeAnimation(
                            1,
                            Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/light-1.png'))),
                            )),
                      ),
                      Positioned(
                        left: 140,
                        width: 80,
                        height: 150,
                        child: FadeAnimation(
                            1.3,
                            Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/light-2.png'))),
                            )),
                      ),
                      Positioned(
                        right: 40,
                        top: 40,
                        width: 80,
                        height: 150,
                        child: FadeAnimation(
                            1.5,
                            Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/clock.png'))),
                            )),
                      ),
                      Positioned(
                        child: FadeAnimation(
                            1.6,
                            Container(
                              margin: EdgeInsets.only(top: 50),
                              child: Center(
                                child: Text(
                                  "Login",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 40,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            )),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(30.0),
                  child: Column(
                    children: <Widget>[
                      FadeAnimation(
                          1.8,
                          Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                      color: Color.fromRGBO(143, 148, 251, .2),
                                      blurRadius: 20.0,
                                      offset: Offset(0, 10))
                                ]),
                            child: Column(
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.all(8.0),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Colors.grey[100]))),
                                  child: TextField(
                                    controller: _usernameController,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Email or Phone number",
                                        hintStyle:
                                            TextStyle(color: Colors.grey[400])),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(8.0),
                                  child: TextField(
                                    obscureText: true,
                                    controller: _passwordController,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Password",
                                        hintStyle:
                                            TextStyle(color: Colors.grey[400])),
                                  ),
                                )
                              ],
                            ),
                          )),
                      SizedBox(
                        height: 30,
                      ),
                      InkWell(
                        onTap: _saveForm,
                        child: FadeAnimation(
                            2,
                            Container(
                              height: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  gradient: LinearGradient(colors: [
                                    Color.fromRGBO(143, 148, 251, 1),
                                    Color.fromRGBO(143, 148, 251, .6),
                                  ])),
                              child: Center(
                                child: Text(
                                  "Login",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            )),
                      ),
                      SizedBox(
                        height: 70,
                      ),
                       Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              InkWell(
                                child: Text(
                                  "Register",
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontFamily: "Aleo",
                                      fontSize:
                                          ScreenUtil.getInstance().setSp(34)),
                                ),
                                onTap: () => Navigator.of(context)
                                    .pushNamed(Signup.routeName),
                              )
                            ],
                          ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}