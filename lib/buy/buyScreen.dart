import 'package:flutter/material.dart';
import 'package:sap_trade/buy/components/bottom_controls.dart';
import 'package:sap_trade/buy/components/form_items.dart';
import 'package:sap_trade/home/home_screen.dart';

import '../constants.dart';

class BuyScreen extends StatefulWidget {

  @override
  _BuyScreenState createState() => _BuyScreenState();
}


class _BuyScreenState extends State<BuyScreen> {

  GlobalKey<FormState> _formKey;

  @override
  void initState() {
    _formKey = new GlobalKey<FormState>();
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
                style: TextStyle(fontSize: 35,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w800,
                ),
              ),
              SizedBox(
                height: size.height*0.05,
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    FormItems(size: size,title: 'Name',type: TextInputType.name),
                    FormItems(size: size,title: 'Location',type: TextInputType.name),
                    FormItems(size: size,title: 'Address',type: TextInputType.streetAddress),
                    FormItems(size: size,title: 'Phone Number',type: TextInputType.phone),
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
                  key: _formKey,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    prefixText: '₹',
                  ),
                ),
              ),
              SizedBox(
                height: size.height*0.05,
              ),
              BottomControls(size: size, formKey: _formKey, nextScreen: HomeScreen()),
            ],
          ),
        ),
      ),
    );
  }
}
