import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseServices{

  final String uid;
  final String plantId;
  DatabaseServices({this.uid, this.plantId});

  //collection reference
  final CollectionReference sellersCollection = FirebaseFirestore.instance.collection('Sellers');
  final CollectionReference plantsCollection = FirebaseFirestore.instance.collection('Plants');
  final CollectionReference buyerCollection = FirebaseFirestore.instance.collection('Buyer');

  Future fetchSellerInformation({String name, String location, String address, dynamic phone, dynamic price, String others, String sun, String moist, String water, String wind, dynamic image}) async{
    return await sellersCollection.doc(uid).collection(plantsCollection.path).doc(plantId).set({
      'name' : name,
      'imageURL' : image,
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

  Future fetchBuyerInformation({String name, String location, String address, dynamic phone, dynamic offeredPrice}) async{
    return await buyerCollection.doc(uid).collection(plantsCollection.path).doc(plantId).set({
      'name' : name,
      'location' : location,
      'address' : address,
      'phoneNumber' : phone,
      'Offered Price': offeredPrice,

    });
  }


}