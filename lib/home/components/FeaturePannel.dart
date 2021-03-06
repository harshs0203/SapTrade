import 'package:flutter/material.dart';

import '../../constants.dart';

SingleChildScrollView FeaturePannel() {
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
      children: [
        FeatureCard(
          image: "assets/images/bottom_img_1.png",
          press: (){},
        ),
        FeatureCard(
          image: "assets/images/bottom_img_2.png",
          press: (){},
        ),
      ],
    ),
  );
}


class FeatureCard extends StatelessWidget {

  final String image;
  final Function press;

  const FeatureCard({Key key, this.image, this.press}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: press,
      child: Container(
        margin: EdgeInsets.only(
          top: kDefaultPadding,
          left: kDefaultPadding/2,
          bottom: kDefaultPadding/2,
        ),
        width: size.width * 0.8,
        height: size.height * 0.18,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(image),
          ),
        ),
      ),
    );
  }
}
