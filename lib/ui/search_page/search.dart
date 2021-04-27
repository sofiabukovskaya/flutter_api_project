import 'dart:convert';

import 'package:artists_app/api/http_GET_request.dart';
import 'package:artists_app/database/firestore/add_data.dart';

import 'package:artists_app/repository/models/artist_model.dart';
import 'package:artists_app/ui/history_page/history.dart';
import 'package:artists_app/ui/search_page/wigets/form.dart';
import 'package:artists_app/ui/search_page/wigets/list_artists.dart';
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
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.green),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Artists'),
          actions: <Widget>[
            IconButton(
                icon: Icon(
                  Icons.history,
                  color: Colors.white,
                ),
                onPressed: () => Navigator.push(context,
                    new MaterialPageRoute(builder: (context) => HistoryPage())))
          ],
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              Padding(padding: EdgeInsets.only(left: 10, right: 10, top: 10)),
              formEnterData(controller),
              Container(margin: const EdgeInsets.only(top: 25.0)),
              RaisedButton(
                color: Colors.green,
                child: Text('Search!'),
                onPressed: () async {
                  listArtist.clear();
                  listArtist.addAll(await httpGet(controller.text));
                  await addData(listArtist, data);
                  setState(() {});
                },
              ),
              Flexible(child: ListArtist(listArtist: listArtist))
            ],
          ),
        ),
      ),
    );
  }
}

