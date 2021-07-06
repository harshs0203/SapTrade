import 'package:flutter/material.dart';
import 'package:sap_trade/order/components/BuyOffers.dart';
import '../../constants.dart';

class SellerData extends StatelessWidget {
  final List sellerOrder;

  const SellerData({Key key, this.sellerOrder}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(sellerOrder.length);

    return Container(
      height: MediaQuery
          .of(context)
          .size
          .height * 0.2,
      width: MediaQuery
          .of(context)
          .size
          .width,
      child: ListView.builder(
        itemCount: sellerOrder.length,
        itemBuilder: (context, index) {
          if (sellerOrder.length != null) {
            return Card(
              elevation: 2.0,
              margin:
              EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
              child: ListTile(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => BuyOffers(plantId: sellerOrder[index]['plantId'],)),
                  );
                },
                title: Row(
                  children: [
                    Text(
                      sellerOrder[index]['seller information']['name']
                          .toString(),
                      style: TextStyle(color: kPrimaryColor),
                    ),
                    Spacer(),
                    Text(
                      sellerOrder[index]['seller information']['location']
                          .toString(),
                      style: TextStyle(color: kPrimaryColor),
                    ),
                    Spacer(),
                    Text(
                      sellerOrder[index]['price'].toString(),
                      style: TextStyle(color: kPrimaryColor),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return Text('No Plant uploaded Yet');
          }
        },
      ),
    );
  }
}
