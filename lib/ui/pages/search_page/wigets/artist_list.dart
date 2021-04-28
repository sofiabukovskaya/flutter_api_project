

import 'package:artists_app/data/models/artist_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class ArtistList extends StatelessWidget {
   List <ArtistModel> listArtist;

   ArtistList(
      {Key key, this.listArtist})
      : super(key: key);

  Widget listArtists() {
    return ListView.builder(
      padding: EdgeInsets.only(right: 5.0, left: 5.0),
      itemCount: listArtist.length,
      itemBuilder: (context, index) {
            return Card(
              child: Column(
                children: [
                  ListTile(
                    title: Text(listArtist[index].name,
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    subtitle: Text(listArtist[index].type),
                  ),
                ],
              ),
            );
      },
    );
  }
  @override
  Widget build(BuildContext context) => listArtists();
}

