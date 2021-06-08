import 'package:data_visualization/pages/map_vaccines.dart';
import 'package:data_visualization/widgets/checkList.dart';
import 'package:flutter/material.dart';

class Selected extends StatefulWidget {
  const Selected({Key? key}) : super(key: key);

  @override
  _SelectedState createState() => _SelectedState();
}

class _SelectedState extends State<Selected> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(
                children: [Text("VACINAVIZ"), CheckList(), MapTotal()])));
  }
}
