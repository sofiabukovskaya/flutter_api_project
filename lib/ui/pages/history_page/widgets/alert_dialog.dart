import 'package:artists_app/data/repository/firestore_repository/repository_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget alertDialog(TextEditingController controller, DocumentSnapshot user,
    BuildContext context, String itemID) {
  return AlertDialog(
    title: Text('Change info'),
    content: Form(
      child: TextFormField(
        controller: controller,
        keyboardType: TextInputType.name,
        decoration: InputDecoration(
          labelText: 'Name artist:',
          hintText: '${user.data()['name'].toString()}',
        ),
        onSaved: (String artistValue) {},
      ),
    ),
    actions: [
      FlatButton(
          child: Text('NO'),
          onPressed: () {
            Navigator.of(context).pop(false);
          }),
      FlatButton(
          child: Text('YES'),
          onPressed: () {
            RepositoryFirestore().updateData(itemID, controller).then((value) =>
                Scaffold.of(context).showSnackBar(SnackBar(
                    content:
                        Text("Update ${user.data()['name'].toString()}"))));
            Navigator.of(context).pop(true);
          }),
    ],
  );
}
