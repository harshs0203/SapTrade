import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sap_trade/modals/sellers.dart';
import 'package:sap_trade/sale/Screens/AdditionalInformation.dart';
import 'package:sap_trade/sale/components/CustomSlider.dart';
import 'package:sap_trade/sale/components/bottom_control_plant.dart';
import 'package:sap_trade/sale/components/plant_image.dart';
import 'package:sap_trade/constants.dart';
import 'package:uuid/uuid.dart';

class PlantDetails extends StatefulWidget {
  final PickedFile imageURL;
  final String name;
  final String location;
  final String address;
  final String phone;
  const PlantDetails(
      {Key key,
      this.imageURL,
      this.name,
      this.location,
      this.address,
      this.phone});
  @override
  _PlantDetailsState createState() => _PlantDetailsState(imageURL: imageURL);
}

class _PlantDetailsState extends State<PlantDetails> {
  var uuid = new Uuid();
  var plantId;

  double sunVal = 50;
  double humdVal = 50;
  double watrVal = 50;
  double windVal = 50;

  String label;
  final PickedFile imageURL;
  Seller sellerInformation = Seller();

  _PlantDetailsState({this.imageURL});

  @override
  void initState() {
    plantId = uuid.v1();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(kDefaultPadding) / 1.4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PlantImage(),
              Container(
                margin: EdgeInsets.fromLTRB(0, 4, 0, 4),
                alignment: Alignment.centerLeft,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Sunlight Requirement',
                      style: TextStyle(
                        fontSize: 15.0,
                      ),
                    ),
                    Slider(
                      activeColor: kPrimaryColor,
                      inactiveColor: Colors.grey.shade400,
                      value: sunVal,
                      min: 0,
                      max: 100,
                      divisions: 5,
                      label: label,
                      onChanged: (double value) {
                        setState(() {
                          sunVal = value;
                          label = labelString(sunVal);
                          sellerInformation.sunlight = label;
                          print('sun: ' + sellerInformation.sunlight);
                        });
                      },
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 4, 0, 4),
                alignment: Alignment.centerLeft,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Humid Capacity',
                      style: TextStyle(
                        fontSize: 15.0,
                      ),
                    ),
                    Slider(
                      activeColor: kPrimaryColor,
                      inactiveColor: Colors.grey.shade400,
                      value: humdVal,
                      min: 0,
                      max: 100,
                      divisions: 5,
                      label: label,
                      onChanged: (double value) {
                        setState(() {
                          humdVal = value;
                          label = labelString(humdVal);
                          sellerInformation.moisture = label;
                          print('humid: ' + sellerInformation.moisture);
                        });
                      },
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 4, 0, 4),
                alignment: Alignment.centerLeft,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Water Requirement',
                      style: TextStyle(
                        fontSize: 15.0,
                      ),
                    ),
                    Slider(
                      activeColor: kPrimaryColor,
                      inactiveColor: Colors.grey.shade400,
                      value: watrVal,
                      min: 0,
                      max: 100,
                      divisions: 5,
                      label: label,
                      onChanged: (double value) {
                        setState(() {
                          watrVal = value;
                          label = labelString(watrVal);
                          sellerInformation.water = label;
                          print('water: ' + sellerInformation.water);
                        });
                      },
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 4, 0, 4),
                alignment: Alignment.centerLeft,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Wind Endurance',
                      style: TextStyle(
                        fontSize: 15.0,
                      ),
                    ),
                    Slider(
                      activeColor: kPrimaryColor,
                      inactiveColor: Colors.grey.shade400,
                      value: windVal,
                      min: 0,
                      max: 100,
                      divisions: 5,
                      label: label,
                      onChanged: (double value) {
                        setState(() {
                          windVal = value;
                          label = labelString(windVal);
                          sellerInformation.wind = label;
                          print('wind: ' + sellerInformation.wind);
                        });
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.040,
              ),
              BottomControlPlant(
                size: MediaQuery.of(context).size,
                nextScreen: AdditionalInformation(
                  plantId: plantId,
                  sunlight: sellerInformation.sunlight,
                  water: sellerInformation.water,
                  humidity: sellerInformation.moisture,
                  wind: sellerInformation.wind,
                  imageURL: sellerInformation.imageURI,
                  name: widget.name,
                  location: widget.location,
                  address: widget.address,
                  phone: widget.phone,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String labelString(double currentSliderValue) {
    String label;

    if (currentSliderValue == 0) {
      label = 'Almost Non Required';
    } else if (currentSliderValue <= 20.0) {
      label = 'Very Low';
    } else if (currentSliderValue <= 40.0) {
      label = 'Low';
    } else if (currentSliderValue <= 60.0) {
      label = 'Normal';
    } else if (currentSliderValue <= 80.0) {
      label = 'High';
    } else if (currentSliderValue <= 100.0) {
      label = 'Very High';
    } else {
      label = 'Invalid';
    }

    return label;
  }
}
