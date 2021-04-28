
import 'package:artists_app/data/models/artist_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class FirestoreProvider {
  final CollectionReference collectionReference =
      FirebaseFirestore.instance.collection('artistsdata');

  addData(
      List<ArtistModel> listArtistResponse, Map<String, dynamic> data) async {
    for (int i = 0; i < listArtistResponse.length; i++) {
      data = {
        'name': listArtistResponse[i].name,
        'type': listArtistResponse[i].type
      };
      await collectionReference.add(data);
    }
  }

  updateData(String itemID, TextEditingController controller) async {
    await collectionReference.doc('$itemID').update({'name': controller.text});
  }

  deleteData(String itemID) async {
    await collectionReference.doc('$itemID').delete();
  }
}
