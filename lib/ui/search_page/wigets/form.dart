import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget formEnterData(TextEditingController controller) {
  return Form(
    child: TextFormField(
      controller: controller,
      keyboardType: TextInputType.name,
      decoration: InputDecoration(
        labelText: 'Name artist:',
        hintText: 'Red Hot Papers',
      ),
      onSaved: (String artistValue) {},
    ),
  );
}