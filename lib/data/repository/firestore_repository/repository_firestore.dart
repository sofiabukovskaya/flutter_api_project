
import 'package:artists_app/data/models/artist_model.dart';
import 'package:artists_app/data/repository/firestore_repository/firestore_provider.dart';
import 'package:flutter/material.dart';

class RepositoryFirestore {
  final firestoreProvider = FirestoreProvider();

    collectionReference() => firestoreProvider.collectionReference;

   addData(List<ArtistModel> listArtistResponse, Map<String, dynamic> data) => firestoreProvider.addData(listArtistResponse, data);
   updateData(String itemID, TextEditingController controller) =>  firestoreProvider.updateData(itemID, controller);
   deleteData(String itemID) => firestoreProvider.deleteData(itemID);
}