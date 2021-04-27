import 'package:artists_app/repository/models/artist_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

addData(List<ArtistModel> listArtistResponse, Map<String, dynamic> data) {
  CollectionReference collectionReference =
  FirebaseFirestore.instance.collection('artistsdata');
  for (int i = 0; i < listArtistResponse.length; i++) {
    data = {
      'name': listArtistResponse[i].name,
      'type': listArtistResponse[i].type
    };
    collectionReference.add(data);
  }
}