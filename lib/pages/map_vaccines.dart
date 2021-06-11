import 'package:data_visualization/controller/data_controller.dart';
import 'package:data_visualization/model/state.dart';
import 'package:data_visualization/widgets/seeMore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:syncfusion_flutter_maps/maps.dart';

class MapTotal extends StatefulWidget {
  const MapTotal();

  @override
  _MapTotalState createState() => _MapTotalState();
}

class _MapTotalState extends State<MapTotal> {
  _MapTotalState();

  late Map<String, StateBr> _data;
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
      final StateBr stateData = values.elementAt(index);
      final keys = _data.keys;
      final state = keys.elementAt(index);
      final text = "$state\n ${stateData.total}";
      return text;
    }, shapeColorValueMapper: (int index) {
      var values = _data.values;
      final StateBr stateData = values.elementAt(index);
      final size = stateData.total;
      if (size <= 2000) {
        return 10;
      } else if (size > 2000 && size <= 10000) {
        return 20;
      } else if (size > 10000 && size <= 20000) {
        return 25;
      } else if (size > 20000 && size <= 30000) {
        return 30;
      } else if (size > 30000 && size <= 40000) {
        return 35;
      } else if (size > 40000 && size <= 50000) {
        return 40;
      } else if (size > 50000 && size <= 60000) {
        return 45;
      } else if (size > 60000 && size <= 70000) {
        return 50;
      } else if (size > 70000 && size <= 80000) {
        return 55;
      } else if (size > 80000 && size <= 100000) {
        return 60;
      } else if (size > 100000 && size <= 120000) {
        return 65;
      } else {
        return 70;
      }
    }, shapeColorMappers: [
      MapColorMapper(
          from: 0, to: 10, color: Colors.red, text: '< 2000 vacinas'),
      MapColorMapper(
          from: 11,
          to: 20,
          color: Color.fromRGBO(226, 110, 110, 1.0),
          text: '2001 - 10000 vacinas'),
      MapColorMapper(
          from: 21,
          to: 25,
          color: Color.fromRGBO(34, 56, 0, 1.0),
          text: '10001 - 20000 vacinas'),
      MapColorMapper(
          from: 26,
          to: 30,
          color: Color.fromRGBO(48, 76, 7, 1.0),
          text: '20001 - 30000 vacinas'),
      MapColorMapper(
          from: 31,
          to: 35,
          color: Color.fromRGBO(65, 96, 19, 1.0),
          text: '30001 - 40000 vacinas'),
      MapColorMapper(
          from: 36,
          to: 40,
          color: Color.fromRGBO(83, 116, 34, 1.0),
          text: '40001 - 50000 vacinas'),
      MapColorMapper(
          from: 41,
          to: 45,
          color: Color.fromRGBO(103, 136, 54, 1.0),
          text: '50001 - 60000 vacinas'),
      MapColorMapper(
          from: 46,
          to: 50,
          color: Color.fromRGBO(124, 155, 77, 1.0),
          text: '60001 - 70000 vacinas'),
      MapColorMapper(
          from: 51,
          to: 55,
          color: Color.fromRGBO(147, 175, 105, 1.0),
          text: '70001 - 80000 vacinas'),
      MapColorMapper(
          from: 56,
          to: 60,
          color: Color.fromRGBO(172, 195, 136, 1.0),
          text: '80001 - 100000 vacinas'),
      MapColorMapper(
          from: 60,
          to: 65,
          color: Color.fromRGBO(223, 232, 209, 1.0),
          text: '100001 - 120000 vacinas'),
      MapColorMapper(
          from: 65,
          to: 70,
          color: Color.fromRGBO(224, 255, 229, 1.0),
          text: '+120000 vacinas'),
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
                final state = _data.keys.elementAt(index);
                final StateBr stateData = _data.values.elementAt(index);

                return SeeMore(
                  size: 550,
                  height: 520,
                  legend:
                      "$state\n\n total vacinas:${stateData.total}\n\n Gênero:\n Mulheres: ${stateData.personWoman}\n Homens:${stateData.personMan}\n\n Raça:\n Branca: ${stateData.personWhite}\n Preta:${stateData.personBlack}\n Parda:${stateData.personPard}\nAmarela: ${stateData.personYellow}\n Não informado: ${stateData.personNo} \n\n Vacinas:\n Sinovac/Butantan:${stateData.butatan}\n Covishield:${stateData.covishield}\n Pharma/Pfizer:${stateData.pfizer}",
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
    ));
  }
}
