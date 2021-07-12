import 'package:flutter/material.dart';

import '../../constants.dart';

class TitlePrice extends StatelessWidget {
  final String title, location, price, seller;

  const TitlePrice(
      {Key key, this.title, this.location, this.price, this.seller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: Row(
        children: [
          RichText(
            text: TextSpan(children: [
              TextSpan(
                text: '$title\n'.toUpperCase(),
                style: Theme.of(context)
                    .textTheme
                    .headline4
                    .copyWith(color: kTextColor, fontWeight: FontWeight.bold),
              ),
              TextSpan(
                text: '$seller\n'.toUpperCase(),
                style: Theme.of(context)
                    .textTheme
                    .headline5
                    .copyWith(color: kTextColor),
              ),
              TextSpan(
                text: '$location',
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  color: kPrimaryColor,
                  fontSize: 20,
                ),
              ),
            ]),
          ),
          Spacer(),
          Text(
            '₹$price',
            style: Theme.of(context)
                .textTheme
                .headline5
                .copyWith(color: kPrimaryColor),
          ),
        ],
      ),
    );
  }
}
