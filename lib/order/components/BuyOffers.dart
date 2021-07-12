import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sap_trade/services/database/dataBaseServices.dart';
import '../../constants.dart';

class BuyOffers extends StatefulWidget {
  final plantId;

  const BuyOffers({Key key, this.plantId}) : super(key: key);

  @override
  _BuyOffersState createState() => _BuyOffersState(plantId);
}

class _BuyOffersState extends State<BuyOffers> {
  final plantId;
  CollectionReference buyerDB = new DatabaseServices().buyerCollection;

  _BuyOffersState(this.plantId);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: buyerDB.where('plantId', isEqualTo: plantId).snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(
                color: kPrimaryColor,
              ),
            );
          }
          final List buyOffers =
              snapshot.data.docs.map((plant) => plant.data()).toList();
          return Container(
            height: MediaQuery.of(context).size.height ,
            width: MediaQuery.of(context).size.width,
            child: Center(
              child: ListView.builder(
                  itemCount: buyOffers.length,
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 2.0,
                      margin: EdgeInsets.symmetric(
                          vertical: 20.0, horizontal: 20.0),
                      child: ListTile(
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Name: '+ buyOffers[index]['name'],
                              style: TextStyle(color: Colors.teal[500],
                              fontSize: 30.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Offered Price: ' + buyOffers[index]['Offered Price'],
                              style: TextStyle(color: kPrimaryColor),
                            ),
                            Text(
                              'Location: ' +buyOffers[index]['location'],
                              style: TextStyle(color: kPrimaryColor),
                            ),
                            Text(
                              'Address: ' +buyOffers[index]['address'],
                              style: TextStyle(color: kPrimaryColor),
                            ),
                            Text(
                              'Phone Number: ' +buyOffers[index]['phoneNumber'],
                              style: TextStyle(color: kPrimaryColor),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            ),
          );
        },
      ),
    );
  }
}
