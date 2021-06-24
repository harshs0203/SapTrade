import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseServices{

  final String uid;
  final String plantId;
  DatabaseServices({this.uid, this.plantId});

  //collection reference
  final CollectionReference sellersCollection = FirebaseFirestore.instance.collection('Sellers');
  final CollectionReference plantsCollection = FirebaseFirestore.instance.collection('Plants');

  Future fetchSellerInformation(String name, String location, String address, String phone, String price, String others, String sun, String moist, String water, String wind) async{
    return await sellersCollection.doc(uid).collection(plantsCollection.path).doc(plantId).set({
      'name' : name,
      'location' : location,
      'address' : address,
      'phoneNumber' : phone,
      'price': price,
      'otherInformation' : others,
      'sunlight' : sun,
      'moisture': moist,
      'water' : water,
      'wind' : wind,
    });
  }
}