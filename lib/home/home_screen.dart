import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sap_trade/home/components/body.dart';
import 'package:sap_trade/modals/sellers.dart';
import 'package:sap_trade/sale/Screens/PersonalDetails.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sap_trade/services/database/dataBaseServices.dart';
import 'components/BottomNavigationBar.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
   Seller seller = Seller();
   List<Seller> listSeller = List();
  // @override
  // void initState() {
  //   DatabaseServices().fetchSellerInfo().then((value) {
   //               seller = value;
   //             });
  //   DatabaseServices().fetchSellerInfo();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: StreamBuilder<QuerySnapshot>(
        stream: DatabaseServices().plantCollection.snapshots(),
        builder: (context, snapshot)  {
          if (snapshot.hasData) {
            DatabaseServices().fetchSellerInfo().then((value) {
                seller = value;
                listSeller.add(seller);
            });
          }
         return Body(sellers: listSeller);
        },
      ),
      bottomNavigationBar: BottomBar(),
    );
  }
}

AppBar buildAppBar(context) {
  return AppBar(
    elevation: 0,
    leading: Row(
      children: [
        IconButton(
          icon: SvgPicture.asset("assets/icons/menu.svg"),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PersonalDetail()),
            );
          },
        ),
      ],
    ),
  );
}
