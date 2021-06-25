import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sap_trade/constants.dart';
import 'package:sap_trade/home/home_screen.dart';
import 'package:sap_trade/modals/sellers.dart';
import 'package:sap_trade/services/database/dataBaseServices.dart';

class AdditionalInformation extends StatefulWidget {
  final String name;
  final String location;
  final String address;
  final String phone;
  final dynamic plantId;
  final dynamic imageURL;
  final String sunlight;
  final String humidity;
  final String water;
  final String wind;

  const AdditionalInformation(
      {Key key,
      this.name,
      this.location,
      this.address,
      this.phone,
      this.plantId,
      this.imageURL,
      this.sunlight,
      this.humidity,
      this.water,
      this.wind})
      : super(key: key);

  @override
  _AdditionalInformationState createState() => _AdditionalInformationState(
      this.name,
      this.location,
      this.address,
      this.phone,
      this.plantId,
      this.imageURL,
      this.sunlight,
      this.humidity,
      this.water,
      this.wind);
}

class _AdditionalInformationState extends State<AdditionalInformation> {
  final String name;
  final String location;
  final String address;
  final String phone;
  final dynamic plantId;
  final dynamic imageURL;
  final String sunlight;
  final String humidity;
  final String water;
  final String wind;

  FirebaseAuth auth = FirebaseAuth.instance;
  String price;
  String otherInformation;

  inputData() {
    final User user = auth.currentUser;
    dynamic userUid;
    return userUid = user.uid;
  }

  _AdditionalInformationState(
      this.name,
      this.location,
      this.address,
      this.phone,
      this.plantId,
      this.imageURL,
      this.sunlight,
      this.humidity,
      this.water,
      this.wind);


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Seller sellerInformation = Seller();

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(kDefaultPadding),
          margin: EdgeInsets.only(top: size.height * 0.02),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Additional Information',
                style: TextStyle(fontSize: 40.0),
              ),
              SizedBox(height: size.height * 0.02),
              Text(
                'Price:',
                style: TextStyle(fontSize: 35),
              ),
              Container(
                width: size.width * 0.5,
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    prefixText: '₹',
                  ),
                  onChanged: (text) {
                    setState(() {
                      price = text;
                    });
                  },
                ),
              ),
              SizedBox(height: size.height * 0.02),
              SizedBox(height: size.height * 0.02),
              Text(
                'Other Information:',
                style: TextStyle(fontSize: 35),
              ),
              TextFormField(
                keyboardType: TextInputType.multiline,
                minLines: 1,
                maxLines: 10,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
                onChanged: (text) {
                  setState(() {
                    otherInformation = text;
                  });
                },
              ),
              SizedBox(height: size.height * 0.25),
              Container(
                alignment: Alignment.bottomRight,
                child: RaisedButton(
                    color: kPrimaryColor,
                    textColor: Colors.white,
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                    onPressed: () async {
                      await DatabaseServices(uid: inputData(), plantId: plantId)
                          .fetchSellerInformation(
                        name: name,
                        location: location,
                        address: address,
                        phone: phone,
                        image: imageURL,
                        sun: sunlight,
                        moist: humidity,
                        water: water,
                        wind: wind,
                        price: price,
                        others: otherInformation,
                      );
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                      );
                    },
                    child: Text('Upload')),
              )
            ],
          ),
        ),
      ),
    );
  }
}
