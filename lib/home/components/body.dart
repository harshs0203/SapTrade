import 'package:flutter/material.dart';
import 'package:sap_trade/home/components/header_with_image.dart';
import 'package:sap_trade/home/components/recommendedPannel.dart';
import 'package:sap_trade/home/components/titleWithButton.dart';
import 'package:sap_trade/modals/sellers.dart';
import '../../constants.dart';
import 'FeaturePannel.dart';

class Body extends StatelessWidget {
  const Body({Key key, this.sellers}) : super(key: key);

  final List sellers;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          HeaderWithImage(size: size), //no data required
          TitleWithMoreBtn(
              title: "Recommended", press: () {}), // no data required
          RecommendedPanel(listSellers: sellers), //REQUIRED
          TitleWithMoreBtn(
            title: 'Featured Plants',
            press: () {},
          ),
          FeaturePannel(),
          SizedBox(
            height: kDefaultPadding,
          ),
        ],
      ),
    );
  }
}

