import 'package:flutter/material.dart';

AppBar appBarWidget(BuildContext context, String title) {
  return AppBar(
    backgroundColor: Colors.white,
    centerTitle: true,
    title: Text(title),
  );
}