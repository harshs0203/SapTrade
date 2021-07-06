import 'package:flutter/material.dart';

import '../../constants.dart';

class BuyerData extends StatelessWidget {
  final List buyerOrder;

  const BuyerData({Key key, this.buyerOrder}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.2,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        itemCount: buyerOrder.length,
        itemBuilder: (context, index) {
          return buyerOrder.length != null
              ?
              Card(
                elevation: 2.0,
                  margin:
                      EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
                  child: ListTile(
                    title: Row(
                      children: [
                        Text(
                          buyerOrder[index]['name'].toString(),
                          style: TextStyle(color: kPrimaryColor),
                        ),
                        Spacer(),
                        Text(
                          buyerOrder[index]['location'].toString(),
                          style: TextStyle(color: kPrimaryColor),
                        ),
                        Spacer(),
                        Text(
                          buyerOrder[index]['Offered Price'].toString(),
                          style: TextStyle(color: kPrimaryColor),
                        ),
                      ],
                    ),
                  ),
                )
              : Center(
                  child: Text(
                    'No Plant uploaded Yet',
                    style: TextStyle(color: Colors.grey),
                  ),
                );
        },
      ),
    );
  }
}
