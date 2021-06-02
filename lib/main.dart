import 'package:data_visualization/service/sus_service.dart';
import 'package:data_visualization/web_plataform.dart';
import 'package:flutter/material.dart';

void main(List<String> arguments) async {
  final list = await SUSService().getVaccines();
  print('size: ${list.length}');
  final list2 = list.take(10).toList();
  print(list2[0].vacinaNome);

  return runApp(MapsApp());
}

class MapsApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Maps Demo',
      home: WebPlataform(),
    );
  }
}
