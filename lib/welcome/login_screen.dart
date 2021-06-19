import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFF0C9869),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Hero(
          tag: 'logo',
          child: Center(
            child: Container(
              child: Image.asset(
                'assets/images/LOGO1.png',
                height: 100,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        FlatButton(
          color: Colors.white,
          onPressed: () {},
          child: Container(
            width: size.width * 0.75,
            padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/GOOGLE 2.png',
                  width: 60,
                ),
                SizedBox(
                  width: 30,
                ),
                Text('Sign In With Google',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Color(0xFF0C9869),
                      fontWeight: FontWeight.bold,
                    )),
              ],
            ),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40.0),

          ),
        ),
      ],
      ),
    );
  }
}
