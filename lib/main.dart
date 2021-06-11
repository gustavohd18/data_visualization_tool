import 'package:data_visualization/controller/data_controller.dart';
import 'package:data_visualization/pages/selected.dart';
import 'package:flutter/material.dart';

void main(List<String> arguments) async {
  return runApp(MapsApp());
}

class MapsApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Maps Demo', home: Selected());
  }
}
