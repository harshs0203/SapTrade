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
    var image = user.photoURL;
    var name = user.displayName;
    var email = user.email;
    var phone = user.phoneNumber;

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
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CircleAvatar(
                radius: 60.0,
                backgroundImage: NetworkImage(image),
              ),
              Spacer(),
              Container(
                padding: EdgeInsets.symmetric(
                    vertical: kDefaultPadding / 2, horizontal: kDefaultPadding),
                alignment: Alignment.centerRight,
                width: MediaQuery.of(context).size.width * 0.52,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  name,
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
                phone.isEmpty ? "Not Provided By User" : phone,
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
                email,
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
