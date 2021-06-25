import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sap_trade/home/home_screen.dart';
import 'package:sap_trade/services/authentication/google_sign_in.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Login(size: size,),
    );
  }
}

class Login extends StatefulWidget {
  const Login({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
            child: Center(
              child: Container(
                child: Image.asset(
                  'assets/images/LOGO1.png',
                  height: 500,
                  width: 250,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          SignInButton
            (widget: widget),
        ],
      ),
    );
  }
}

class SignInButton extends StatelessWidget {
  const SignInButton({
    Key key,
    @required this.widget,
  }) : super(key: key);

  final Login widget;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      color: Colors.white,
      onPressed: () {
        final provider =
        Provider.of<GoogleSignInProvider>(context, listen: false);
        provider.login();
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
      },
      child: Container(
        width: widget.size.width * 0.75,
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
            Text(
              'Sign In With Google',
              style: TextStyle(
                fontSize: 20.0,
                color: Color(0xFF0C9869),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40.0),
      ),
    );
  }
}


