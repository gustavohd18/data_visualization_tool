import 'package:data_visualization/model/vaccine.dart';
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
        return Color.fromRGBO(72, 209, 204, 1.0);
      } else if (size > 1000 && size <= 5000) {
        return Color.fromRGBO(72, 220, 204, 1.0);
      } else {
        return Color.fromRGBO(72, 245, 204, 1.0);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "${_data.keys.elementAt(index)}\nvacinas: ${_data.values.elementAt(index).length.toString()}",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  );
                },
                dataLabelSettings: MapDataLabelSettings(
                    textStyle: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize:
                            Theme.of(context).textTheme.caption!.fontSize)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
