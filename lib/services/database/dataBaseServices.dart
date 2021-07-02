import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:sap_trade/modals/sellers.dart';

class DatabaseServices {
  final String uid;
  final String plantId;

  DatabaseServices({this.uid, this.plantId});

  //collection reference
  final CollectionReference sellersCollection =
      FirebaseFirestore.instance.collection('Sellers');
  final CollectionReference plantCollection =
      FirebaseFirestore.instance.collection('Plant');
  final CollectionReference buyerCollection =
      FirebaseFirestore.instance.collection('Buyer');

  // Future sendingSellerInformation(
  //     {String name,
  //     String location,
  //     String address,
  //     dynamic phone,
  //     dynamic price,
  //     String others,
  //     String sun,
  //     String moist,
  //     String water,
  //     String wind,
  //     String plantId,
  //     dynamic image}) async {
  //   return await sellersCollection
  //       .doc(uid)
  //       .collection(plantCollection.path)
  //       .doc(plantId)
  //       .set({
  //     'name': name,
  //     'imageURL': image,
  //     'location': location,
  //     'address': address,
  //     'phoneNumber': phone,
  //     'price': price,
  //     'otherInformation': others,
  //     'sunlight': sun,
  //     'moisture': moist,
  //     'water': water,
  //     'wind': wind,
  //   });
  // }

  Future sendingSellerInformation(
      {String name,
      String location,
      String address,
      dynamic phone,
      dynamic price,
      String others,
      String sun,
      String moist,
      String water,
      String wind,
      dynamic image}) async {
    return await plantCollection.doc(plantId).set({
      'seller information': {
        'name': name,
        'location': location,
        'address': address,
        'phoneNumber': phone,
        'userId': uid,
      },
      'imageURL': image,
      'price': price,
      'otherInformation': others,
      'sunlight': sun,
      'moisture': moist,
      'water': water,
      'wind': wind,
      'timestamp' : FieldValue.serverTimestamp(),
    });
  }

  Future sendingBuyerInformation(
      {String name,
      String location,
      String address,
      dynamic phone,
      dynamic offeredPrice,
      String plantId}) async {
    return await buyerCollection.doc(uid).set({
      'name': name,
      'location': location,
      'address': address,
      'phoneNumber': phone,
      'Offered Price': offeredPrice,
      'plantId': plantId,
    });
  }

  // Future<List<Seller>> fetchSellerInfo(Iterable<QueryDocumentSnapshot<Object>> snapshot) async {
  //
  //   Seller seller = Seller();
  //   List<Seller> listSeller = [];
  //
  //     for (var plantInfo in snapshot) {
  //       Map<String, dynamic> sell = plantInfo.get('seller information');
  //
  //       seller.name = sell['name'];
  //       seller.location = sell['location'];
  //       seller.address = sell['address'];
  //       seller.phoneNumber = sell['phoneNumber'];
  //
  //       seller.imageURL = plantInfo.get('imageURL');
  //       seller.sunlight = plantInfo.get('sunlight');
  //       seller.moisture = plantInfo.get('moisture');
  //       seller.water = plantInfo.get('water');
  //       seller.wind = plantInfo.get('wind');
  //       seller.price = plantInfo.get('price');
  //       seller.otherInformation = plantInfo.get('otherInformation');
  //
  //       listSeller.add(seller);
  //       return listSeller;
  //    }
  // }
}
