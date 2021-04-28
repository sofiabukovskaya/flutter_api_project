import 'dart:convert';

import 'package:artists_app/data/models/artist_model.dart';
import 'package:artists_app/data/repository/api_repository/repository_api.dart';
import 'package:artists_app/data/repository/firestore_repository/repository_firestore.dart';
import 'package:artists_app/ui/pages/history_page/history.dart';
import 'package:artists_app/ui/pages/search_page/wigets/artist_list.dart';
import 'package:artists_app/ui/pages/search_page/wigets/text_form_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SearchPageState();
  }
}

class SearchPageState extends State<SearchPage> {
  final controller = TextEditingController();
  List<ArtistModel> listArtist = [];
  Map<String, dynamic> data;

  @override
  Widget build(BuildContext context) {
     return Scaffold(
        appBar: AppBar(
          title: Text('Artists'),
          actions: <Widget>[
            IconButton(
                icon: Icon(
                  Icons.history,
                  color: Colors.white,
                ),
                onPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) => HistoryPage())))
          ],
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              Padding(padding: EdgeInsets.only(left: 10, right: 10, top: 10)),
              textFormField(controller),
              Container(margin: const EdgeInsets.only(top: 25.0)),
              RaisedButton(
                color: Colors.green,
                child: Text('Search!'),
                onPressed: () async {
                  listArtist.clear();
                  listArtist.addAll(await RepositoryApi().loadArtists(controller.text));
                  await RepositoryFirestore().addData(listArtist, data);
                  setState(() {});
                },
              ),
              Flexible(child: ArtistList(listArtist: listArtist))
            ],
          ),
        ),
    );
  }
}

