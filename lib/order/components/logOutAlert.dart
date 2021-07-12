import 'package:flutter/material.dart';
import 'package:sap_trade/services/authentication/google_sign_in.dart';
import 'package:sap_trade/welcome/splash_screen.dart';

import '../../constants.dart';

class LogOutAlert extends StatelessWidget {
  const LogOutAlert({
    Key key,
    @required this.provider,
  }) : super(key: key);

  final GoogleSignInProvider provider;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'Log Out',
        style: TextStyle(color: Colors.teal[700]),
      ),
      content: Text('Are you sure you want to log out?'),
      actions: [
        FlatButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            'No',
            style: TextStyle(color: kPrimaryColor),
          ),
        ),
        FlatButton(
          onPressed: () {
            provider.logout();
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => SplashScreen()),
            );
          },
          child:
          Text('Yes', style: TextStyle(color: kPrimaryColor)),
        )
      ],
      elevation: 24.0,
    );
  }
}
