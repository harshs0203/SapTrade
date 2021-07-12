import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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

  String plantName;
  String location;
  String sellerName;
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
            left: kDefaultPadding,
          ),
          child: Column(

            crossAxisAlignment: CrossAxisAlignment.start,
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Plant Name',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Otomanopee',
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
                              return 'Please enter your plant\'s name';
                            }
                            return null;
                          },
                          onChanged: (text) {
                            setState(() {
                              plantName = text;
                              sellerInformation.plantName = plantName;
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
                          keyboardType: TextInputType.text,
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
                              sellerInformation.location = location;
                            });
                          },
                        ),
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                        Text(
                          'Seller\'s Name',
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
                              return 'Please enter your name';
                            }
                            return null;
                          },
                          onChanged: (text) {
                            setState(() {
                              sellerName = text;
                              sellerInformation.sellerName = sellerName;
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
                              sellerInformation.phoneNumber = phone;
                            });
                          },
                        ),
                        // FlatButton(onPressed: (){print(phone);}, child: Text('check')),
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
                  size: size,
                  formKey: _formKey,
                  nextScreen: PlantDetails(
                      plantName: sellerInformation.plantName,
                      location: sellerInformation.location,
                      name: sellerInformation.sellerName,
                      phone: sellerInformation.phoneNumber)),
            ],
          ),
        ),
      ),
    );
  }
}
