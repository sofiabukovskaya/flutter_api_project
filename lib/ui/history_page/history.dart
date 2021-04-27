

import 'package:artists_app/ui/history_page/widgets/load_data_list.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
          stream:FirebaseFirestore.instance.collection('artistsdata').snapshots() ,
          builder: loadArtistList,
        )
    );
  }
}
