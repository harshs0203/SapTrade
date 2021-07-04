import 'package:flutter/material.dart';
import 'package:sap_trade/buy/buyScreen.dart';
import 'package:sap_trade/detail/components/showDetails.dart';
import 'package:sap_trade/detail/components/title_price.dart';
import '../../constants.dart';
import 'image_pannel.dart';

class Body extends StatelessWidget {
  const Body({Key key, this.listSeller, this.index}) : super(key: key);

  final List listSeller;
  final int index;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          ImagePanel.ImagePanel(
            size: size,
            imagePath: listSeller[index]['imageURL'].toString(),
            sun: listSeller[index]['sunlight'].toString(),
            moist: listSeller[index]['moisture'].toString(),
            wind: listSeller[index]['wind'].toString(),
            water: listSeller[index]['water'].toString(),
          ),
          TitlePrice(
            title: listSeller[index]['seller information']['name'].toString(),
            price: listSeller[index]['price'].toString(),
            location:
                listSeller[index]['seller information']['location'].toString(),
          ),
          Row(
            children: [
              SizedBox(
                width: size.width / 2,
                height: 84,
                child: FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                    ),
                  ),
                  color: kPrimaryColor,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => BuyScreen()),
                    );
                  },
                  child: Text(
                    "Buy Now",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: FlatButton(
                  onPressed: () {
                    showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        builder: (context) => SingleChildScrollView(
                          child: Container(
                            padding: EdgeInsets.only(
                                bottom: MediaQuery.of(context).viewInsets.bottom),
                            child: ShowDetails(details: listSeller[index]['otherInformation'].toString() ,addTaskCallBack: (newTaskTile){
                              Navigator.pop(context);
                            }),
                          ),
                        ));
                  },
                  child: Text("Description"),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
