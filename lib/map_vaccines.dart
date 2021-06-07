import 'package:data_visualization/controller/data_controller.dart';
import 'package:data_visualization/model/vaccine.dart';
import 'package:data_visualization/widgets/seeMore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:syncfusion_flutter_maps/maps.dart';

class WebPlataform extends StatefulWidget {
  const WebPlataform();

  @override
  _WebPlataformState createState() => _WebPlataformState();
}

class _WebPlataformState extends State<WebPlataform> {
  _WebPlataformState();

  late Map<String, List<Vaccine>> _data;
  late MapShapeSource _mapSource;

  @override
  void initState() {
    final data = DataController().getListVaccinesPerState();
    var newMap2 = data;

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
                  final state = _data.keys.elementAt(index);
                  final size = _data.values.elementAt(index).length;
                  final woman = _data.values
                      .elementAt(index)
                      .where((element) =>
                          element.pacienteEnderecoUf == state &&
                          element.pacienteSexo == "F")
                      .length;
                  final man = _data.values
                      .elementAt(index)
                      .where((element) =>
                          element.pacienteEnderecoUf == state &&
                          element.pacienteSexo == "M")
                      .length;
                  final black = _data.values
                      .elementAt(index)
                      .where((element) =>
                          element.pacienteEnderecoUf == state &&
                          element.pacienteRaca == "02")
                      .length;
                  final blank = _data.values
                      .elementAt(index)
                      .where((element) =>
                          element.pacienteEnderecoUf == state &&
                          element.pacienteRaca == "01")
                      .length;
                  final pard = _data.values
                      .elementAt(index)
                      .where((element) =>
                          element.pacienteEnderecoUf == state &&
                          element.pacienteRaca == "03")
                      .length;
                  final yellow = _data.values
                      .elementAt(index)
                      .where((element) =>
                          element.pacienteEnderecoUf == state &&
                          element.pacienteRaca == "04")
                      .length;
                  final noInformation = _data.values
                      .elementAt(index)
                      .where((element) =>
                          element.pacienteEnderecoUf == state &&
                          element.pacienteRaca == "99")
                      .length;

                  final butantan = _data.values
                      .elementAt(index)
                      .where((element) =>
                          element.pacienteEnderecoUf == state &&
                          element.vacinaNome ==
                              "Covid-19-Coronavac-Sinovac/Butantan")
                      .length;
                  final covishield = _data.values
                      .elementAt(index)
                      .where((element) =>
                          element.pacienteEnderecoUf == state &&
                          element.vacinaNome == "Vacina Covid-19 - Covishield")
                      .length;

                  final astraZeneca = _data.values
                      .elementAt(index)
                      .where((element) =>
                          element.pacienteEnderecoUf == state &&
                          element.vacinaNome == "Covid-19-AstraZeneca")
                      .length;
                  return SeeMore(
                    legend:
                        "$state\n\n total vacinas:$size\n\n Gênero:\n Mulheres: $woman\n Homens:$man\n\n Raça:\n Branca: $blank\n Preta: $black\n Parda: $pard \nAmarela: $yellow \n Não informado: $noInformation \n\n Vacinas:\n Sinovac/Butantan:$butantan\n Covishield:$covishield\n AstraZeneca:$astraZeneca",
                    vaccines: _data.values.elementAt(index),
                    state: "",
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
      )),
    ])));
  }
}
