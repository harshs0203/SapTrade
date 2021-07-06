import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sap_trade/modals/sellers.dart';

import '../../constants.dart';

class AnimatedProperty extends StatefulWidget {
  final image;
  final String iconText;

  const AnimatedProperty({Key key, this.image, this.iconText})
      : super(key: key);

  @override
  State<AnimatedProperty> createState() =>
      _AnimatedPropertyState(image: image, iconText: iconText);
}

class _AnimatedPropertyState extends State<AnimatedProperty> {
  bool selected = false;
  final image;
  final String iconText;

  _AnimatedPropertyState({this.image, this.iconText});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    print(iconText);
    print(image);

    return GestureDetector(
      onTap: () {
        setState(() {
          selected = !selected;
          Timer.periodic(Duration(milliseconds: 5), (timer) {
            selected = !selected;
          });
        });
      },
      child: Center(
        child: AnimatedContainer(
          margin: EdgeInsets.symmetric(vertical: size.height * 0.03),
          padding: EdgeInsets.all(kDefaultPadding / 2.5),
          width: selected ? 200.0 : 64.0,
          height: selected ? 64.0 : 64.0,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.0),
          ),
          alignment: selected
              ? Alignment.centerLeft
              : AlignmentDirectional.centerStart,
          duration: const Duration(seconds: 2),
          curve: Curves.fastOutSlowIn,
          child: selected
              ? Container(
                  child: Row(
                    children: [
                      SvgPicture.asset(image),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        iconText,
                        style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                          color: kPrimaryColor,
                        ),
                      ),
                    ],
                  ),
                )
              : Container(
                  child: SvgPicture.asset(image),
                ),
        ),
      ),
    );
  }
}
