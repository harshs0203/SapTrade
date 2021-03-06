import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sap_trade/home/home_screen.dart';
import 'package:sap_trade/modals/buyers.dart';
import 'package:sap_trade/services/database/dataBaseServices.dart';

import '../constants.dart';

class BuyScreen extends StatefulWidget {
  final plantId;

  const BuyScreen({Key key, this.plantId}) : super(key: key);

  @override
  _BuyScreenState createState() => _BuyScreenState(plantId);
}

class _BuyScreenState extends State<BuyScreen> {
  FirebaseAuth auth = FirebaseAuth.instance;
  Buyer _buyer = Buyer();
  final plantId;
  String name;
  String location;
  String address;
  String phone;
  String price;

  _BuyScreenState(this.plantId);

  inputData() {
    final User user = auth.currentUser;
    dynamic userUid;
    return userUid = user.uid;
  }

  GlobalKey<FormState> _formKey;

  @override
  void initState() {
    _formKey = GlobalKey<FormState>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            right: kDefaultPadding,
            left: kDefaultPadding / 2,
            top: kDefaultPadding * 0.50,
            bottom: kDefaultPadding * 0.50,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                height: size.height * 0.05,
              ),
              Text(
                "Enter Your Details Here",
                style: TextStyle(
                  fontSize: 35,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w800,
                ),
              ),
              SizedBox(
                height: size.height * 0.05,
              ),
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Name',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.name,
                      cursorColor: kPrimaryColor,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your name';
                        }
                        return null;
                      },
                      onChanged: (text) {
                        setState(() {
                          name = text;
                          _buyer.name = name;
                        });
                      },
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Text(
                      'Location',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.name,
                      cursorColor: kPrimaryColor,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your location';
                        }
                        return null;
                      },
                      onChanged: (text) {
                        setState(() {
                          location = text;
                          _buyer.location = location;
                        });
                      },
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Text(
                      'Address',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.streetAddress,
                      cursorColor: kPrimaryColor,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your address';
                        }
                        return null;
                      },
                      onChanged: (text) {
                        setState(() {
                          address = text;
                          _buyer.location = address;
                        });
                      },
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Text(
                      'Phone Number',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.phone,
                      cursorColor: kPrimaryColor,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter you phone number';
                        }
                        if (value.length > 10 || value.length < 10) {
                          return 'Enter a valid Number';
                        }
                        return null;
                      },
                      onChanged: (text) {
                        setState(() {
                          phone = text;
                          _buyer.pNum = phone;
                        });
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: size.height * 0.05,
              ),
              Text(
                'Offered Price:',
                style: TextStyle(fontSize: 35),
              ),
              Container(
                width: size.width * 0.5,
                child: TextFormField(
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    prefixText: '???',
                  ),
                  onChanged: (text) {
                    setState(() {
                      price = text;
                      _buyer.price = price;
                    });
                  },
                ),
              ),
              SizedBox(
                height: size.height * 0.05,
              ),
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
                      await DatabaseServices(plantId: plantId, uid: inputData())
                          .sendingBuyerInformation(
                        name: name,
                        location: location,
                        address: address,
                        phone: phone,
                        offeredPrice: price,
                        userId: inputData(),
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
