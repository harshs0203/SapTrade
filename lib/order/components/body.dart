import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sap_trade/constants.dart';
import 'package:sap_trade/order/components/buyerData.dart';
import 'package:sap_trade/order/components/personalDetails.dart';
import 'package:sap_trade/order/components/sellerData.dart';
import 'package:sap_trade/services/authentication/google_sign_in.dart';
import 'package:sap_trade/services/database/dataBaseServices.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  CollectionReference sellerDB = new DatabaseServices().plantCollection;
  CollectionReference buyerDB = new DatabaseServices().buyerCollection;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<GoogleSignInProvider>(context);
    final FirebaseAuth auth = FirebaseAuth.instance;
    String uid;

    setState(() {
      uid = auth.currentUser == null
          ? provider.googleSignIn.clientId
          : auth.currentUser.uid;
      return uid;
    });

    return StreamBuilder<Object>(
      stream: auth.authStateChanges(),
      builder: (context, snapshot) {
        return Scaffold(
          body: Padding(
            padding: EdgeInsets.only(
              top: kDefaultPadding * 2,
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PersonalDetails(),
                  Text(
                    'Buy Orders',
                    style: TextStyle(
                      fontSize: 50.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      children: [
                        Text(
                          'Name',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Spacer(),
                        Text(
                          'Location',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Spacer(),
                        Text(
                          'Offered Price',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  StreamBuilder<QuerySnapshot>(
                    stream: buyerDB.where('userId', isEqualTo: uid).snapshots(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return Center(
                          child: CircularProgressIndicator(
                            color: kPrimaryColor,
                          ),
                        );
                      }
                      final List buyerOrder = snapshot.data.docs
                          .map((plant) => plant.data())
                          .toList();
                      return BuyerData(buyerOrder: buyerOrder);
                    },
                  ),
                  Text(
                    'Sell Orders',
                    style: TextStyle(
                      fontSize: 50.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      children: [
                        Text(
                          'Plant Name',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Spacer(),
                        Text(
                          'Location',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Spacer(),
                        Text(
                          'Price',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  // OrderDetailsCard(),
                  StreamBuilder<QuerySnapshot>(
                    stream: sellerDB
                        .where('seller information.userId', isEqualTo: uid)
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return Center(
                          child: CircularProgressIndicator(
                            color: kPrimaryColor,
                          ),
                        );
                      }
                      final List sellerOrder = snapshot.data.docs
                          .map((plant) => plant.data())
                          .toList();
                      return SellerData(sellerOrder: sellerOrder);
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
