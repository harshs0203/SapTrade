import 'package:flutter/material.dart';
import 'package:sap_trade/SaleScreen/components/plant_image.dart';

class PlantDetails extends StatefulWidget {
  @override
  _PlantDetailsState createState() => _PlantDetailsState();
}

class _PlantDetailsState extends State<PlantDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          PlantImage(),

        ],
      ),
    );
  }
}
