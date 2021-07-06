import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sap_trade/constants.dart';
import 'package:sap_trade/home/components/body.dart';
import 'package:sap_trade/modals/sellers.dart';
import 'package:sap_trade/services/database/dataBaseServices.dart';
import 'components/BottomNavigationBar.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Seller seller = Seller();
  CollectionReference dbService = new DatabaseServices().plantCollection;

  List<dynamic> plants = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: dbService.orderBy('timestamp').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.data == null)
            return Center(
              child: CircularProgressIndicator(
                color: kPrimaryColor,
              ),
            );

          final List plants =
              snapshot.data.docs.map((plant) => plant.data()).toList();

          return Body(sellers: plants);
        },
      ),
      bottomNavigationBar: BottomBar(),
    );
  }
}
