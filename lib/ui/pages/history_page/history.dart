

import 'package:artists_app/data/repository/firestore_repository/repository_firestore.dart';
import 'package:artists_app/ui/pages/history_page/widgets/history_artist_list.dart';

import 'package:flutter/material.dart';

class HistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text(
            'History search',
            style: TextStyle(color: Colors.white),
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: StreamBuilder (
          stream: RepositoryFirestore().collectionReference(),
          builder: historyArtistList,
        )
    );
  }
}
