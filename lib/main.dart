import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sap_trade/constants.dart';
import 'package:sap_trade/services/authentication/AuthenticationPage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:sap_trade/services/authentication/google_sign_in.dart';

Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GoogleSignInProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Sap Trade',
        theme: ThemeData(
          fontFamily: 'Otomanopee',
          scaffoldBackgroundColor: kBackgroundColor,
          primaryColor: kPrimaryColor,
          textTheme: Theme.of(context).textTheme.apply(bodyColor: kTextColor),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Authentication(),
      ),
    );
  }
}
