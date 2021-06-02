import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sap_trade/constants.dart';
import 'package:sap_trade/home/components/body.dart';

class Body extends StatelessWidget {
  const Body({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        SizedBox(
          height: size.height *0.8,
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical : kDefaultPadding * 3),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: IconButton(
                          padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                            icon: SvgPicture.asset('assets/icons/back_arrow.svg'),
                            onPressed: () {
                              Navigator.pop(context);
                            }),
                      ),
                      Spacer(),
                    ],
                  ),
                ),
              ),
              Container(
                height: size.height * 0.8,
                width: size.width * 0.75,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 10),
                      blurRadius: 60,
                      color: kPrimaryColor.withOpacity(0.30),
                    ),
                  ],
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(65),
                    bottomLeft: Radius.circular(65),
                  ),
                  image: DecorationImage(
                    alignment: Alignment.centerLeft,
                    fit: BoxFit.cover,
                    image: AssetImage('assets/images/img.png'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
