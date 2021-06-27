import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseServices {
  final String uid;

  DatabaseServices({this.uid});

  //collection reference
  final CollectionReference sellersCollection =
      FirebaseFirestore.instance.collection('Sellers');
  final CollectionReference plantsCollection =
      FirebaseFirestore.instance.collection('Plants');
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
      String plantId,
      dynamic image}) async {
    return await sellersCollection
        .doc(uid)
        .set({
      'name': name,
      'imageURL': image,
      'location': location,
      'address': address,
      'phoneNumber': phone,
      'price': price,
      'otherInformation': others,
      'sunlight': sun,
      'moisture': moist,
      'water': water,
      'wind': wind,
      'plantId': plantId
    });
  }

  Future sendingBuyerInformation(
      {String name,
      String location,
      String address,
      dynamic phone,
      dynamic offeredPrice,
        String plantId
      }) async {
    return await buyerCollection
        .doc(uid)
        .set({
      'name': name,
      'location': location,
      'address': address,
      'phoneNumber': phone,
      'Offered Price': offeredPrice,
      'plantId' : plantId,
    });
  }

  void fetchingSellerInfo() {
    sellersCollection.get().then((QuerySnapshot snapshot) {
      snapshot.docs.forEach((DocumentSnapshot doc) {
        print(doc.data());
      });
    });
  }
}
