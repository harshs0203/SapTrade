import 'package:flutter/material.dart';
import 'package:sap_trade/SaleScreen/components/CustomSlider.dart';
import 'package:sap_trade/SaleScreen/components/plant_image.dart';
import 'package:sap_trade/constants.dart';

class PlantDetails extends StatefulWidget {
  @override
  _PlantDetailsState createState() => _PlantDetailsState();
}

class _PlantDetailsState extends State<PlantDetails> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(kDefaultPadding),
        child: Column(
          children: [
            PlantImage(),
            CustomSlider(sliderName: 'Sunlight Requirement',numberOfDivisions: 5),
            CustomSlider(sliderName: 'Moisture Requirement',numberOfDivisions: 5),
            CustomSlider(sliderName: 'Water Requirement',numberOfDivisions: 5),
            CustomSlider(sliderName: 'Wind Requirement',numberOfDivisions: 5),
          ],
        ),
      ),
    );
  }
}