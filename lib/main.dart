import 'package:flutter/material.dart';
import 'package:newsmawa/pages/home.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {'/': (context) => Home()},
  ));
}
