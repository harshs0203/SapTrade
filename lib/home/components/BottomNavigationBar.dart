import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:sap_trade/order/orderScreen.dart';
import 'package:sap_trade/sale/Screens/PersonalDetails.dart';
import 'package:sap_trade/services/authentication/google_sign_in.dart';
import 'package:sap_trade/services/database/dataBaseServices.dart';
import 'package:sap_trade/welcome/splash_screen.dart';
import '../../constants.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Size size  = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.only(left: kDefaultPadding *2,
        right: kDefaultPadding *2,
      ),
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -10),
            blurRadius: 35,
            color: kPrimaryColor.withOpacity(0.35),
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
              icon: Icon(
                Icons.filter_vintage,
                color: kPrimaryColor,
                size: size.aspectRatio * 60,
              ),
              onPressed: () {}),
          IconButton(
            icon: Icon(
              Icons.add,
              color: Colors.grey[400],
              size: size.aspectRatio * 60,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PersonalDetail()),
              );
            },
          ),
          IconButton(
              icon: Icon(
                Icons.person,
                color: Colors.grey[400],
                size: size.aspectRatio * 60,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Order()),
                );
              }),
        ],
      ),
    );
  }
}