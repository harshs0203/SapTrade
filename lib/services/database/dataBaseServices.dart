import 'package:cloud_firestore/cloud_firestore.dart';
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

  Future<Seller> fetchSellerInfo() async {
    Seller seller = Seller();

    await for (var snapshot in plantCollection.snapshots()) {
      for (var sellerInfo in snapshot.docs) {
        Map<String, dynamic> sell = sellerInfo.get('seller information');

        seller.name = sell['name'];
        seller.location = sell['location'];
        seller.address = sell['address'];
        seller.phoneNumber = sell['phoneNumber'];

        seller.imageURL = sellerInfo.get('imageURL');
        seller.sunlight = sellerInfo.get('sunlight');
        seller.moisture = sellerInfo.get('moisture');
        seller.water = sellerInfo.get('water');
        seller.wind = sellerInfo.get('wind');
        seller.price = sellerInfo.get('price');
        seller.otherInformation = sellerInfo.get('otherInformation');
        print(seller.location);
        return seller;
      }
      return seller;
    }
    return seller;
  }
}
