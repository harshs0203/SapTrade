import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'login_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


//TODO: Fix Hero Animation

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = new Timer(Duration(seconds: 5),
            () => Navigator.push(
            context, PageRouteBuilder(transitionDuration: Duration(seconds: 2) , pageBuilder: (_,__,___)=> LoginScreen())));
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
                height: 700,
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

  @override
  void dispose() {
   _timer.cancel();
    super.dispose();
  }

}
