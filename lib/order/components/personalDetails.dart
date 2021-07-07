import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
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
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CircleAvatar(
                radius: 60.0,
                backgroundImage: image.isEmpty ? null : NetworkImage(image),
              ),
              Spacer(),
              Container(
                padding: EdgeInsets.symmetric(
                  vertical: kDefaultPadding / 2,
                  horizontal: kDefaultPadding,
                ),
                alignment: Alignment.centerRight,
                width: MediaQuery.of(context).size.width * 0.52,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  name.isEmpty ? 'User' : name.toString(),
                  style: TextStyle(
                    color: Colors.teal.shade700,
                    fontWeight: FontWeight.bold,
                    fontSize: 30.0,
                  ),
                ),
              ),
            ],
          ),
          Card(
            margin: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
            child: ListTile(
              leading: Icon(
                Icons.phone,
                color: Colors.teal,
              ),
              title: Text(
                phone.isEmpty ? 'Not Provided By The User' : phone.toString(),
                style: TextStyle(
                  color: Colors.teal.shade900,
                  fontSize: 18.0,
                ),
              ),
            ),
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
