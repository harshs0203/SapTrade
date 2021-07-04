import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseServices {
  final String uid;
  final String plantId;

  DatabaseServices({this.uid, this.plantId});

  final CollectionReference plantCollection =
      FirebaseFirestore.instance.collection('Plant');
  final CollectionReference buyerCollection =
      FirebaseFirestore.instance.collection('Buyer');

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
    return await plantCollection.doc().set({
      'seller information': {
        'name': name,
        'location': location,
        'address': address,
        'phoneNumber': phone,
        'userId': uid,
      },
      'plantId': plantId,
      'imageURL': image,
      'price': price,
      'otherInformation': others,
      'sunlight': sun,
      'moisture': moist,
      'water': water,
      'wind': wind,
      'timestamp': FieldValue.serverTimestamp(),
    });
  }

  Future sendingBuyerInformation(
      {String name,
      String location,
      String address,
      dynamic phone,
      dynamic userId,
      dynamic offeredPrice}) async {
    return await buyerCollection.doc().set({
      'name': name,
      'location': location,
      'address': address,
      'phoneNumber': phone,
      'Offered Price': offeredPrice,
      'userId': uid,
      'plantId': plantId,
    });
  }
}
