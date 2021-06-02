import 'package:flutter/material.dart';
import 'package:sap_trade/detail/detailScreen.dart';

import '../../constants.dart';

class recommendedPannel extends StatelessWidget {
  const recommendedPannel({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          RecommendedCard(
            image: 'assets/images/image_1.png',
            title: 'customer 1',
            location: 'location',
            price: 100,
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailScreen(),
                ),
              );
            },
          ),
          RecommendedCard(
            image: 'assets/images/image_2.png',
            title: 'customer 1',
            location: 'location',
            price: 100,
            press: () {},
          ),
          RecommendedCard(
            image: 'assets/images/image_3.png',
            title: 'customer 1',
            location: 'location',
            price: 100,
            press: () {},
          ),
        ],
      ),
    );
  }
}

class RecommendedCard extends StatelessWidget {
  final String image, title, location;
  final int price;
  final Function press;

  const RecommendedCard(
      {Key key, this.image, this.title, this.location, this.price, this.press})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(
        left: kDefaultPadding,
        top: kDefaultPadding / 2,
        bottom: kDefaultPadding * 2.5,
      ),
      width: size.width * 0.4,
      child: Column(
        children: [
          Image.asset(image),
          GestureDetector(
            onTap: press,
            child: Container(
              padding: EdgeInsets.all(kDefaultPadding / 2),
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 10),
                      blurRadius: 50,
                      color: kPrimaryColor.withOpacity(0.3),
                    ),
                  ],
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                  )),
              child: Row(
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: title.toUpperCase() + '\n',
                          style: Theme.of(context).textTheme.button,
                        ),
                        TextSpan(
                          text: location.toUpperCase(),
                          style: TextStyle(
                            color: kPrimaryColor.withOpacity(0.5),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  Text(
                    '\₹$price',
                    style: Theme.of(context)
                        .textTheme
                        .button
                        .copyWith(color: kPrimaryColor),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
