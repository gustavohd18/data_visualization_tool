import 'package:data_visualization/model/vaccine.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:syncfusion_flutter_maps/maps.dart';
import "package:collection/collection.dart";
/// This widget is the home page of the application.
class WebPlataform extends StatefulWidget {
  /// Initialize the instance of the [MyHomePage] class.
  const WebPlataform({required this.vaccines});

  final List<Vaccine> vaccines;

  @override
  _WebPlataformState createState() => _WebPlataformState();
}

class _WebPlataformState extends State<WebPlataform> {
  _WebPlataformState();

  late List<Vaccine> _data;
  late MapShapeSource _mapSource;

  @override
  void initState() {

      var newMap = groupBy(widget.vaccines, (Vaccine obj) => obj.vacinaDataAplicacao);
      newMap.forEach((key, value) {
        print("keY: ${key}  and value: ${value}");
      });
    _data = widget.vaccines;

    _mapSource = MapShapeSource.asset(
      'assets/brazil.json',
      shapeDataField: 'sigla',
      dataCount: _data.length,
      primaryValueMapper: (int index) => _data[index].pacienteEnderecoUf.toUpperCase(),
      dataLabelMapper: (int index) => _data[index].pacienteEnderecoUf.toUpperCase(),
      shapeColorValueMapper: (int index) => Color.fromRGBO(72, 209, 204, 1.0),
    );
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
                      _data[index].pacienteSexo,
                      style: TextStyle(color: Colors.white),
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

/// Collection of Australia state code data.
class Model {
  /// Initialize the instance of the [Model] class.
  const Model(this.state, this.color, this.stateCode);

  /// Represents the Australia state name.
  final String state;

  /// Represents the Australia state color.
  final Color color;

  /// Represents the Australia state code.
  final String stateCode;
}
