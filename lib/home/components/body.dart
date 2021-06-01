import 'package:flutter/material.dart';
import 'package:sap_trade/home/components/header_with_image.dart';

import '../../constants.dart';

class Body extends StatelessWidget {
  const Body({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          HeaderWithImage(size: size),
          Container(
            height: 24,
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: kDefaultPadding / 4),
                  child: Text(
                    'Recommended',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Positioned(
                  child: Container(
                    height: 7,
                    color: kPrimaryColor.withOpacity(0.2),
                  ),
                  left: 0.0,
                  right: 0.0,
                  bottom: 0.0,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
