import 'package:data_visualization/controller/data_controller.dart';
import 'package:data_visualization/pages/map_days.dart';
import 'package:data_visualization/pages/map_genre.dart';
import 'package:data_visualization/pages/map_rac.dart';
import 'package:data_visualization/pages/map_vaccines.dart';
import 'package:data_visualization/widgets/checkList.dart';
import 'package:flutter/material.dart';
import 'package:rx_notifier/rx_notifier.dart';

class Selected extends StatefulWidget {
  const Selected({Key? key}) : super(key: key);

  @override
  _SelectedState createState() => _SelectedState();
}

class _SelectedState extends State<Selected> {
  late DataController controller;
  @override
  void initState() {
    controller = DataController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(children: [
      Text("VACINAVIZ"),
      CheckList(),
      RxBuilder(builder: (_) => MapData(type: controller.isAllData.value))
    ])));
  }
}

class MapData extends StatelessWidget {
  const MapData({required this.type});

  final int type;

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case 1:
        return MapTotal();
      case 2:
        return MapDays();
      case 3:
        return MapGenre(genre: "M");
      case 4:
        return MapGenre(genre: "F");
      case 5:
        return MapRac(rac: "01");
      case 6:
        return MapRac(rac: "02");
      case 7:
        return MapRac(rac: "03");
      case 8:
        return MapRac(rac: "04");
      default:
        return MapDays();
    }
  }
}