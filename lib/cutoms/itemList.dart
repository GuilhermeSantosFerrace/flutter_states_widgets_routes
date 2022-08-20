

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget getItemList( String title, String subtitle, IconData data) {
  return Card(
    child: ListTile(
    leading: Icon(data),
    title: Text(title),
    subtitle: Text(subtitle),
  )
);
}