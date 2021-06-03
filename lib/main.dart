import 'package:data_visualization/model/vaccine.dart';
import 'package:data_visualization/service/sus_service.dart';
import 'package:data_visualization/web_plataform.dart';
import 'package:flutter/material.dart';

void main(List<String> arguments) async {
  final list = await SUSService().getVaccines();
//  print('size: ${list.length}');
  //print(list[0].vacinaDataAplicacao);

  return runApp(MapsApp(
    vaccines: list,
  ));
}

class MapsApp extends StatelessWidget {
  MapsApp({required this.vaccines});

  final List<Vaccine> vaccines;
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Maps Demo',
      home: WebPlataform(
        vaccines: vaccines,
      ), //WebPlataform(),
    );
  }
}
