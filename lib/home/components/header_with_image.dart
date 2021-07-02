import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sap_trade/sale/Screens/PersonalDetails.dart';
import '../../constants.dart';

class HeaderWithImage extends StatelessWidget {
  const HeaderWithImage({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: kDefaultPadding * 0.5),
      // It will cover 20% of our total height
      height: size.height * 0.25,
      width: size.width,
      child: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
              top: kDefaultPadding * 2.5,
              right: kDefaultPadding,
              bottom: 36 + kDefaultPadding,
            ),
            width: size.width,
            decoration: BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(36),
                bottomRight: Radius.circular(36),
              ),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 10),
                  blurRadius: 50,
                  color: kPrimaryColor.withOpacity(0.23),
                ),
              ],
            ),
            child: Row(
              children: [
                Column(
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
                SizedBox(width: size.width * 0.16,),
                Image.asset(
                  'assets/images/LOGO1.png',
                  height: size.height * 0.5,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
