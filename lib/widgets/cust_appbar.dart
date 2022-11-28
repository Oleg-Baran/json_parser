import 'package:flutter/material.dart';

AppBar topAppBar(String title) {
  return AppBar(
    elevation: 0.1,
    backgroundColor: const Color.fromRGBO(58, 66, 86, 1.0),
    title: Text(title),
  );
}
