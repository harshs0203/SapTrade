import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sap_trade/constants.dart';
import 'package:sap_trade/sale/Screens/plant_details.dart';

class PlantImage extends StatefulWidget {
  @override
  _PlantImageState createState() => _PlantImageState();
}

class _PlantImageState extends State<PlantImage> {
  PickedFile _imageFile;
  ImagePicker _picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(kDefaultPadding * 2),
      child: Column(
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
                            return CameraBottomSheet();
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
          )
        ],
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Container CameraBottomSheet() {
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
      passingImage(_imageFile);
    });
  }

  void passingImage(PickedFile pickedFile){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PlantDetails(imageURL: pickedFile)),
    );
  }
}



