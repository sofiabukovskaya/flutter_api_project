
import 'package:artists_app/data/repository/firestore_repository/repository_firestore.dart';
import 'package:artists_app/ui/pages/history_page/widgets/alert_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final controller = TextEditingController();

Widget historyArtistList(
    BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
  if (snapshot.hasData) {
    return ListView.builder(
        itemCount: snapshot.data.docs.length,
        itemBuilder: (context, index) {
          DocumentSnapshot user = snapshot.data.docs[index];
          final itemID = snapshot.data.docs[index].id;
          return Dismissible(
              direction: DismissDirection.endToStart,
              background: Container(
                padding: EdgeInsets.only(top: 18, right: 15),
                alignment: Alignment.topRight,
                color: Colors.red,
                child: Icon(
                  Icons.delete,
                  color: Colors.white70,
                  size: 35,
                ),
              ),
              key: UniqueKey(),
              child: ListTile(
                title: Text(user.data()['name'].toString()),
                subtitle: Text(user.data()['type'].toString()),
                onTap: () async {
                  // ignore: missing_return
                  await showDialog(
                      context: context,
                      builder: (BuildContext context) {
                       return alertDialog(controller, user, context, itemID);
                      });
                },
              ),
              onDismissed: (direction) async {
                await RepositoryFirestore().deleteData(itemID);
                Scaffold.of(context).showSnackBar(SnackBar(
                    content:
                        Text("Deleted ${user.data()['name'].toString()}")));
              });
        });
  } else if (snapshot.connectionState == ConnectionState.done &&
      !snapshot.hasData) {
    return Center(
      child: Text("No users found."),
    );
  } else {
    return Center(child: CircularProgressIndicator());
  }
}
