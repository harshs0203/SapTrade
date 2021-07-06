import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sap_trade/constants.dart';
import 'package:sap_trade/order/components/buyerData.dart';
import 'package:sap_trade/order/components/personalDetails.dart';
import 'package:sap_trade/order/components/sellerData.dart';
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

    final FirebaseAuth auth = FirebaseAuth.instance;
    final User user = auth.currentUser;
    String uid = user.uid;

    // StreamBuilder<Object>(
    //     stream: auth.authStateChanges(),
    // builder: (context, snapshot) {

    return StreamBuilder<Object>(
      stream: auth.authStateChanges(),
    builder: (context, snapshot) {
      return Scaffold(
        body: Padding(
          padding: EdgeInsets.only(
            top: kDefaultPadding * 2,
            //right: kDefaultPadding,
            //left: kDefaultPadding,
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
                    final List buyerOrder =
                    snapshot.data.docs.map((plant) => plant.data()).toList();
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
                // OrderDetailsCard(),
                StreamBuilder<QuerySnapshot>(
                  stream: sellerDB.where(
                      'seller information.userId', isEqualTo: uid).snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Center(
                        child: CircularProgressIndicator(
                          color: kPrimaryColor,
                        ),
                      );
                    }
                    final List sellerOrder =
                    snapshot.data.docs.map((plant) => plant.data()).toList();
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