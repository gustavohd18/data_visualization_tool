import 'package:data_visualization/model/vaccine.dart';
import 'package:data_visualization/widgets/seeMore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:syncfusion_flutter_maps/maps.dart';
import "package:collection/collection.dart";

class WebPlataform extends StatefulWidget {
  const WebPlataform({required this.vaccines});

  final List<Vaccine> vaccines;

  @override
  _WebPlataformState createState() => _WebPlataformState();
}

class _WebPlataformState extends State<WebPlataform> {
  _WebPlataformState();

  late Map<String, List<Vaccine>> _data;
  late MapShapeSource _mapSource;

  @override
  void initState() {
    var newMap2 =
        groupBy(widget.vaccines, (Vaccine obj) => obj.pacienteEnderecoUf);

    _data = newMap2;

    _mapSource = MapShapeSource.asset('assets/brazil.json',
        shapeDataField: 'sigla',
        dataCount: _data.length, primaryValueMapper: (int index) {
      var keys = _data.keys;
      return keys.elementAt(index);
    }, dataLabelMapper: (int index) {
      var values = _data.values;
      final List<Vaccine> list = values.elementAt(index);
      final keys = _data.keys;
      final state = keys.elementAt(index);
      final text = "$state\n ${list.length.toString()}";
      return text;
    }, shapeColorValueMapper: (int index) {
      var values = _data.values;
      final List<Vaccine> list = values.elementAt(index);
      final size = list.length;
      if (size <= 1000) {
        return Color.fromRGBO(72, 200, 204, 1.0);
      } else if (size > 1000 && size <= 5000) {
        return Color.fromRGBO(72, 205, 204, 1.0);
      } else if (size > 5000 && size <= 9000) {
        return Color.fromRGBO(72, 210, 204, 1.0);
      } else if (size > 9000 && size <= 12000) {
        return Color.fromRGBO(72, 215, 204, 1.0);
      } else if (size > 12000 && size <= 18000) {
        return Color.fromRGBO(72, 220, 204, 1.0);
      } else if (size > 18000 && size <= 30000) {
        return Color.fromRGBO(72, 225, 204, 1.0);
      } else if (size > 30000 && size <= 40000) {
        return Color.fromRGBO(72, 230, 204, 1.0);
      } else if (size > 40000 && size <= 50000) {
        return Color.fromRGBO(72, 235, 204, 1.0);
      } else if (size > 50000 && size <= 55000) {
        return Color.fromRGBO(72, 240, 204, 1.0);
      } else {
        return Color.fromRGBO(72, 245, 204, 1.0);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(children: [
      // TODO: FORMAT TEXT
      Text("VACINAVIZ"),
      Expanded(
          child: Padding(
        padding: EdgeInsets.fromLTRB(10, 50, 0, 0),
        child: Center(
          child: SfMaps(
            layers: <MapShapeLayer>[
              MapShapeLayer(
                source: _mapSource,
                showDataLabels: true,
                legend: MapLegend(MapElement.shape),
                tooltipSettings: MapTooltipSettings(
                    color: Colors.grey[700],
                    strokeColor: Colors.white,
                    strokeWidth: 2),
                strokeColor: Colors.white,
                strokeWidth: 0.5,
                shapeTooltipBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                      onDoubleTap: () => print("Clicked"),
                      child: SeeMore(
                        legend:
                            "${_data.keys.elementAt(index)}\nvacinas: ${_data.values.elementAt(index).length.toString()}",
                        vaccines: _data.values.elementAt(index),
                      ));
                },
                dataLabelSettings: MapDataLabelSettings(
                    textStyle: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 14)),
              ),
            ],
          ),
        ),
      ))
    ])));
  }
}
