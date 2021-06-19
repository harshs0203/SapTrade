import 'package:flutter/material.dart';
import 'package:sap_trade/sale/Screens/AdditionalInformation.dart';
import 'package:sap_trade/sale/components/CustomSlider.dart';
import 'package:sap_trade/sale/components/bottom_control_plant.dart';
import 'package:sap_trade/sale/components/bottom_controls.dart';
import 'package:sap_trade/sale/components/plant_image.dart';
import 'package:sap_trade/constants.dart';

class PlantDetails extends StatefulWidget {
  @override
  _PlantDetailsState createState() => _PlantDetailsState();
}

class _PlantDetailsState extends State<PlantDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(kDefaultPadding) / 1.4 ,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PlantImage(),
              CustomSlider(
                  sliderName: 'Sunlight Requirement', numberOfDivisions: 5),
              CustomSlider(
                  sliderName: 'Moisture Requirement', numberOfDivisions: 5),
              CustomSlider(
                  sliderName: 'Water Requirement', numberOfDivisions: 5),
              CustomSlider(
                  sliderName: 'Wind Requirement', numberOfDivisions: 5),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.040,
              ),
              BottomControlPlant(size: MediaQuery.of(context).size, nextScreen: AdditionalInformation(),),
            ],
          ),
        ),
      ),
    );
  }
}