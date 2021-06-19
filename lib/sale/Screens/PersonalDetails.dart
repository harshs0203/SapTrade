import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sap_trade/sale/Screens/plant_details.dart';
import 'package:sap_trade/sale/components/bottom_controls.dart';
import 'package:sap_trade/sale/components/form_items.dart';

import '../../constants.dart';

class PersonalDetail extends StatefulWidget {
  const PersonalDetail({Key key}) : super(key: key);

  @override
  _PersonalDetailState createState() => _PersonalDetailState();
}

class _PersonalDetailState extends State<PersonalDetail> {

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
              left: kDefaultPadding / 2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                height: size.height * 0.05,
              ),
              Text(
                "Enter Your Personal Details Here",
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
                height: size.height*0.1,
              ),
              BottomControls(size: size, formKey: _formKey, nextScreen: PlantDetails()),
            ],
          ),
        ),
      ),
    );
  }
}

