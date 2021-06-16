import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants.dart';

class IconCard extends StatelessWidget {

  final String image;

  const IconCard({Key key, this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.symmetric(vertical: size.height*0.03),
      padding: EdgeInsets.all(kDefaultPadding / 2.5),
      height: 62,
      width: 62,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 15),
            blurRadius: 20,
            color: kPrimaryColor.withOpacity(0.20),
          ),
          BoxShadow(
            offset: Offset(-15, -15),
            blurRadius: 20,
            color: Colors.white,
          ),
        ],
      ),
      child: IconButton(
          icon: SvgPicture.asset(image),
          onPressed: () {}),
    );
  }
}
