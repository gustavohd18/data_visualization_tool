import 'package:data_visualization/controller/data_controller.dart';
import 'package:data_visualization/model/vaccine.dart';
import 'package:data_visualization/pages/MapSilder.dart';
import 'package:data_visualization/pages/map_genre.dart';
import 'package:data_visualization/pages/map_rac.dart';
import 'package:data_visualization/pages/map_vaccines.dart';
import 'package:data_visualization/service/sus_service.dart';
import 'package:flutter/material.dart';

void main(List<String> arguments) async {
  await DataController().initData();

  return runApp(MapsApp());
}

class MapsApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Maps Demo', home: MapRac(rac: "02"));
  }
}
