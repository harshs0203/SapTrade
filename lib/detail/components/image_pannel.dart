import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sap_trade/detail/components/IconCard.dart';
import 'package:sap_trade/detail/components/animated_property.dart';

import '../../constants.dart';

class ImagePanel extends StatelessWidget {
  const ImagePanel.ImagePanel({
    Key key,
    @required this.size,
    this.imagePath,
    this.sun,
    this.moist,
    this.wind,
    this.water,
  }) : super(key: key);

  final String imagePath;

  final Size size;
  final String sun;
  final String moist;
  final String wind;
  final String water;

  @override
  Widget build(BuildContext context) {
    final img = Image.file(File(imagePath));

    return Padding(
      padding: const EdgeInsets.only(bottom: kDefaultPadding * 3),
      child: SizedBox(
        height: size.height * 0.8,
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: kDefaultPadding * 3),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: IconButton(
                          padding:
                              EdgeInsets.symmetric(horizontal: kDefaultPadding),
                          icon: SvgPicture.asset('assets/icons/back_arrow.svg'),
                          onPressed: () {
                            Navigator.pop(context);
                          }),
                    ),
                    Spacer(),
                    AnimatedProperty(
                        image: 'assets/icons/sun.svg', iconText: sun),
                    AnimatedProperty(
                      image: 'assets/icons/icon_2.svg',
                      iconText: moist,
                    ),
                    AnimatedProperty(
                      image: 'assets/icons/icon_3.svg',
                      iconText: water,
                    ),
                    AnimatedProperty(
                      image: 'assets/icons/icon_4.svg',
                      iconText: wind,
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: kDefaultPadding * 0.2),
              child: Stack(
                children: [
                  Container(
                    height: size.height / 1.55,
                    width: size.width * 0.65,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 10),
                          blurRadius: 60,
                          color: kPrimaryColor.withOpacity(0.30),
                        ),
                      ],
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(60),
                        bottomLeft: Radius.circular(60),
                      ),
                      image: DecorationImage(

                        alignment: Alignment.centerLeft,
                        // fit: BoxFit.cover,
                        image: (imagePath == 'assets/images/plantDefault.png')
                            ? AssetImage(imagePath)
                            : img.image,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
