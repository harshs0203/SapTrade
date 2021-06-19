import 'dart:async';
import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 5),
        () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFF0C9869),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Hero(
            tag: 'logo',
            child: Container(
              child: Image.asset(
                'assets/images/LOGO1.png',
                height: 300,
              ),
            ),
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: SpinKitRipple(
                color: Colors.white,
              )),
        ],
      ),
    );
  }
}
