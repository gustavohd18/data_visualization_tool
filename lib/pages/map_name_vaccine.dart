import 'package:data_visualization/controller/data_controller.dart';
import 'package:data_visualization/model/vaccine.dart';
import 'package:data_visualization/widgets/seeMore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:syncfusion_flutter_maps/maps.dart';

class MapVaccine extends StatefulWidget {
  const MapVaccine({required this.name});

  final String name;

  @override
  _MapVaccineState createState() => _MapVaccineState();
}

class _MapVaccineState extends State<MapVaccine> {
  late Map<String, List<Vaccine>> _data;
  late List<Vaccine> _dataFinal;
  late MapShapeSource _mapSource;

  @override
  void initState() {
    final data = DataController().getListVaccinesPerName();
    var newMap2 = data;

    newMap2.forEach((key, value) {
      print("KEy: $key");
    });

    _data = newMap2;

    _dataFinal =
        _data.entries.firstWhere((element) => element.key == widget.name).value;

    _mapSource = MapShapeSource.asset('assets/brazil.json',
        shapeDataField: 'sigla',
        dataCount: _dataFinal.length, primaryValueMapper: (int index) {
      return _dataFinal[index].pacienteEnderecoUf;
    }, dataLabelMapper: (int index) {
      final state = _dataFinal[index].pacienteEnderecoUf;
      final size = _dataFinal
          .where((element) =>
              element.pacienteEnderecoUf == state &&
              element.vacinaNome == widget.name)
          .length;
      final text = "$state\n $size";
      return text;
    }, shapeColorValueMapper: (int index) {
      final size = _dataFinal
          .where((element) =>
              element.pacienteEnderecoUf ==
                  _dataFinal[index].pacienteEnderecoUf &&
              element.vacinaNome == widget.name)
          .length;
      if (size <= 1000) {
        return 10;
      } else if (size > 1000 && size <= 5000) {
        return 20;
      } else if (size > 5000 && size <= 9000) {
        return 25;
      } else if (size > 9000 && size <= 12000) {
        return 30;
      } else if (size > 12000 && size <= 18000) {
        return 35;
      } else if (size > 18000 && size <= 30000) {
        return 40;
      } else if (size > 30000 && size <= 40000) {
        return 45;
      } else if (size > 40000 && size <= 50000) {
        return 50;
      } else if (size > 50000 && size <= 55000) {
        return 55;
      } else {
        return 60;
      }
    }, shapeColorMappers: [
      MapColorMapper(
          from: 0, to: 10, color: Colors.red, text: '< 1000 vacinas'),
      MapColorMapper(
          from: 11,
          to: 20,
          color: Color.fromRGBO(42, 111, 55, 1.0),
          text: '1000 - 5000 vacinas'),
      MapColorMapper(
          from: 21,
          to: 30,
          color: Color.fromRGBO(26, 148, 49, 1.0),
          text: '5001 - 12000 vacinas'),
      MapColorMapper(
          from: 31,
          to: 40,
          color: Color.fromRGBO(89, 182, 91, 1.0),
          text: '12001 - 30000 vacinas'),
      MapColorMapper(
          from: 41,
          to: 50,
          color: Color.fromRGBO(98, 166, 92, 1.0),
          text: '30001 - 50000 vacinas'),
      MapColorMapper(
          from: 51,
          to: 60,
          color: Color.fromRGBO(119, 176, 108, 1.0),
          text: '+ 50000 vacinas'),
    ]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
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
                final state = _dataFinal[index].pacienteEnderecoUf;
                final size = _dataFinal
                    .where((element) =>
                        element.pacienteEnderecoUf ==
                            _dataFinal[index].pacienteEnderecoUf &&
                        element.vacinaNome == widget.name)
                    .length;

                return SeeMore(
                  size: 150,
                  height: 180,
                  legend: "$state\n\n total vacinas:$size\n\n",
                  vaccines: _dataFinal,
                  state: state,
                );
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
    ));
  }
}