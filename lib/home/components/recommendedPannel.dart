import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sap_trade/detail/detailScreen.dart';
import 'package:sap_trade/modals/sellers.dart';

import '../../constants.dart';

class RecommendedPanel extends StatelessWidget {
  const RecommendedPanel({
    Key key, this.listSellers,
  }) : super(key: key);
  final List<Seller> listSellers;


  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.35,
            child: ListView.builder(
             scrollDirection: Axis.horizontal,
              itemCount: listSellers.length,
              itemBuilder: (context, index) {
                return RecommendedCard(
                      image: listSellers[index].imageURL,
                      title: listSellers[index].name,
                      location: listSellers[index].location,
                      price: listSellers[index].price,
                      press: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailScreen(listSeller:  listSellers),
                          ),
                        );
                      },
                    );
              },
            ),
          ),
        ),
      ],
    );
  }
}

class RecommendedCard extends StatelessWidget {
  final String image, title, location;
  final String price;
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
                          text: location.toUpperCase() + '\n',
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
