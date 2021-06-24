import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sap_trade/sale/Screens/AdditionalInformation.dart';
import 'package:sap_trade/sale/Screens/plant_details.dart';
import 'package:sap_trade/sale/components/bottom_controls.dart';
import 'package:sap_trade/modals/sellers.dart';
import '../../constants.dart';

class PersonalDetail extends StatefulWidget {
  const PersonalDetail({Key key}) : super(key: key);

  @override
  _PersonalDetailState createState() => _PersonalDetailState();
}

class _PersonalDetailState extends State<PersonalDetail> {
  GlobalKey<FormState> _formKey;
  Seller sellerInformation = Seller();

  String name;
  String location;
  String address;
  String phone;

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
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                height: size.height * 0.05,
              ),
              Text(
                "Enter Your Personal Details Here",
                style: TextStyle(
                  fontSize: 35,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w800,
                ),
              ),
              SizedBox(
                height: size.height * 0.05,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Form(
                    key: _formKey,
                    child: Column(
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
                              return 'Please enter some text';
                            }
                            return null;
                          },
                          onChanged: (text) {
                            name = text;
                            sellerInformation.name = name;
                            print('Name of Seller :' + sellerInformation.name);
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
                          keyboardType: TextInputType.text,
                          cursorColor: kPrimaryColor,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                          onChanged: (text) {
                            location = text;
                            sellerInformation.location = location;
                            print('location of Seller :' + sellerInformation.location);
                          },
                        ),
                        SizedBox(
                          height: size.height * 0.01,
                        ),Text(
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
                              return 'Please enter some text';
                            }
                            return null;
                          },
                          onChanged: (text) {
                            address = text;
                            sellerInformation.address = address;
                            print('Address of Seller :' + sellerInformation.address);
                          },
                        ),
                        SizedBox(
                          height: size.height * 0.01,
                        ),Text(
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
                              return 'Please enter some text';
                            }
                            return null;
                          },
                          onChanged: (text) {
                            phone = text;
                            sellerInformation.phoneNumber = phone;
                            print('Number of Seller :' + sellerInformation.phoneNumber);
                          },
                        ),
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.1,
              ),
              BottomControls(
                  size: size, formKey: _formKey, nextScreen: PlantDetails(name: sellerInformation.name,location: sellerInformation.location,address: sellerInformation.address,phone: sellerInformation.phoneNumber)),
            ],
          ),
        ),
      ),
    );
  }
}
