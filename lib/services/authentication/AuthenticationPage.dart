import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sap_trade/constants.dart';
import 'package:sap_trade/home/home_screen.dart';
import 'package:sap_trade/services/authentication/google_sign_in.dart';
import 'package:sap_trade/welcome/splash_screen.dart';

class Authentication extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: StreamBuilder<Object>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            final provider = Provider.of<GoogleSignInProvider>(context);
            if (provider.isSigningIn) {
              return buildLoading();
            } else if (snapshot.hasData) {
              print('uid:' + FirebaseAuth.instance.currentUser.uid);
              return HomeScreen();
            } else {
              return SplashScreen();
            }
          }
        ),
    );
  }

  Widget buildLoading() => Stack(
        fit: StackFit.expand,
        children: [
          Center(
            child: CircularProgressIndicator(
              backgroundColor: kPrimaryColor,
            ),
          ),
        ],
      );
}
