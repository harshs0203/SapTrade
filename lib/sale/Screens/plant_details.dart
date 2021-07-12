import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sap_trade/modals/sellers.dart';
import 'package:sap_trade/sale/Screens/AdditionalInformation.dart';
import 'package:sap_trade/sale/components/bottom_control_plant.dart';
import 'package:sap_trade/constants.dart';
import 'package:uuid/uuid.dart';

class PlantDetails extends StatefulWidget {
  final String plantName;
  final String location;
  final String name;
  final String phone;

  const PlantDetails(
      {Key key,
      this.plantName,
      this.location,
      this.name,
      this.phone});

  @override
  _PlantDetailsState createState() => _PlantDetailsState();
}

class _PlantDetailsState extends State<PlantDetails> {
  var uuid = new Uuid();
  var plantId;
  PickedFile _imageFile;
  ImagePicker _picker = ImagePicker();
  double sunVal = 0;
  double humdVal = 0;
  double watrVal = 0;
  double windVal = 0;

  String label ;
  Seller sellerInformation = Seller();

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
              Stack(
                children: [
                  Center(
                    child: Container(
                      child: _imageFile == null
                          ? Image.asset(
                        'assets/images/plantDefault.png',
                        width: MediaQuery.of(context).size.width * 0.75,
                        height: MediaQuery.of(context).size.height * 0.5,
                      )
                          : Image(
                        width: MediaQuery.of(context).size.width * 0.75,
                        height: MediaQuery.of(context).size.height * 0.5,
                        image: FileImage(
                          File(_imageFile.path),
                        ),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 10),
                            blurRadius: 50,
                            color: kPrimaryColor.withOpacity(0.3),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 20.0,
                    right: 20.0,
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              builder: (BuildContext context) {
                                return cameraBottomSheet();
                              },
                            );
                          },
                          child: Icon(
                            Icons.camera_alt,
                            color: kPrimaryColor,
                            size: 40.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 4, 0, 4),
                alignment: Alignment.centerLeft,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
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
             // FlatButton(onPressed: (){print(widget.phone);}, child: Text('check')),
              BottomControlPlant(
                size: MediaQuery.of(context).size,
                nextScreen: AdditionalInformation(
                  plantId: plantId,
                  sunlight: sellerInformation.sunlight,
                  water: sellerInformation.water,
                  humidity: sellerInformation.moisture,
                  wind: sellerInformation.wind,
                  imageURL: _imageFile != null ? _imageFile.path : 'assets/images/plantDefault.png',
                  plantName: widget.plantName,
                  location: widget.location,
                  name: widget.name,
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
    }else {
      label = 'Invalid';
    }
    return label;
  }

  Container cameraBottomSheet() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.15,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
      child: Column(
        children: [
          Text(
            'Choose an image of your plant!',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FlatButton.icon(
                icon: Icon(Icons.camera_alt_outlined),
                onPressed: () {
                  selectImage(ImageSource.camera);
                },
                label: Text('Camera'),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.01,
              ),
              FlatButton.icon(
                icon: Icon(Icons.image),
                onPressed: () {
                  selectImage(ImageSource.gallery);
                },
                label: Text('Gallery'),
              ),
            ],
          )
        ],
      ),
    );
  }
  void selectImage(ImageSource source) async {
    final pickedFile = await _picker.getImage(
      source: source,
    );
    setState(() {
      _imageFile = pickedFile;
    });
  }

}
