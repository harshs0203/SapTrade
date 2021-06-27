import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sap_trade/sale/Screens/PersonalDetails.dart';
import 'package:sap_trade/home/components/body.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sap_trade/services/database/dataBaseServices.dart';
import 'components/BottomNavigationBar.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    DatabaseServices().fetchingSellerInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Body(),
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
