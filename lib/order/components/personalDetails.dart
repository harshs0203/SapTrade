import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sap_trade/services/authentication/google_sign_in.dart';
import 'package:sap_trade/welcome/splash_screen.dart';
import '../../constants.dart';

class PersonalDetails extends StatelessWidget {
  const PersonalDetails({
    Key key,
  });

  @override
  Widget build(BuildContext context) {

    final FirebaseAuth auth = FirebaseAuth.instance;
    final User user = auth.currentUser;
    return StreamBuilder<Object>(
        stream: auth.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return PersonalCard(
              image: user.photoURL == null ? '' :user.photoURL.toString(),
              name: user.displayName == null ? '' :user.displayName.toString(),
              phone: user.phoneNumber == null ? '' :user.phoneNumber.toString(),
              email: user.email == null ? '' :user.email.toString(),
            );
          } else {
            return PersonalCard(image: '',name: '', phone: '',email: '',);
          }
        });
  }
}

class PersonalCard extends StatelessWidget {
  const PersonalCard({
    Key key,
    @required this.image,
    @required this.name,
    @required this.phone,
    @required this.email,
  }) : super(key: key);

  final String image;
  final String name;
  final String phone;
  final String email;

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.only(
          top: kDefaultPadding,
          bottom: kDefaultPadding,
          right: kDefaultPadding * 0.5,
          left: kDefaultPadding * 0.5),
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(20), bottomLeft: Radius.circular(20)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          CircleAvatar(
            radius: 60.0,
            backgroundImage: image.isEmpty ? null : NetworkImage(image),
          ),
          SizedBox(
            height: size.height *0.03,
          ),
          Card(
            margin: EdgeInsets.symmetric(horizontal: 20.0),
            child: ListTile(
              leading: Icon(
                Icons.person,
                color: Colors.teal,
              ),
              title: Text(
                name.isEmpty ? 'User' : name.toString(),
                style: TextStyle(
                  color: Colors.teal.shade700,
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0,
                ),
              ),
            ),
          ),
          SizedBox(
            height: size.height *0.03,
          ),
          Card(
            margin: EdgeInsets.symmetric(horizontal: 20.0),
            child: ListTile(
              leading: Icon(
                Icons.email,
                color: Colors.teal,
              ),
              title: Text(
                email.isEmpty ? 'Not Provided By The User' : email.toString(),
                style: TextStyle(
                  color: Colors.teal.shade900,
                  fontSize: 18.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
