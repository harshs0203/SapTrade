import 'package:flutter/material.dart';
import 'package:sap_trade/home/components/header_with_image.dart';
import 'package:sap_trade/home/components/recommendedPannel.dart';
import 'package:sap_trade/home/components/titleWithButton.dart';

import '../../constants.dart';
import 'FeaturePannel.dart';

class Body extends StatelessWidget {
  const Body({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          HeaderWithImage(size: size),
          TitleWithMoreBtn(title: "Recommended", press: () {}),
          recommendedPannel(),
          TitleWithMoreBtn(
            title: 'Featured Plants',
            press: () {},
          ),
          FeaturePannel(),
          SizedBox(height: kDefaultPadding,),
        ],
      ),
    );
  }
}