import 'package:data_visualization/controller/data_controller.dart';
import 'package:data_visualization/model/state.dart';
import 'package:data_visualization/model/vaccine.dart';
import 'package:data_visualization/widgets/seeMore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:syncfusion_flutter_maps/maps.dart';

class MapRac extends StatefulWidget {
  const MapRac({required this.rac});

  final String rac;

  @override
  _MapRacState createState() => _MapRacState();
}

class _MapRacState extends State<MapRac> {
  late List<StateBr> _data;
  late List<StateBr> _dataFinal;
  late MapShapeSource _mapSource;

  @override
  void initState() {
    final data = DataController().getListVaccinesPerRac(widget.rac);
    var newMap2 = data;

    _data = newMap2;

    // genre for parameter maybe
    _dataFinal = _data;

    _mapSource = MapShapeSource.asset('assets/brazil.json',
        shapeDataField: 'sigla',
        dataCount: _dataFinal.length, primaryValueMapper: (int index) {
      return _dataFinal[index].name;
    }, dataLabelMapper: (int index) {
      final state = _dataFinal[index].name;
      final size = _dataFinal[index].total;
      final text = "$state\n $size";
      return text;
    }, shapeColorValueMapper: (int index) {
      final size = _dataFinal[index].total;
      if (size <= 1000) {
        return 10;
      } else if (size > 1000 && size <= 5000) {
        return 20;
      } else if (size > 5000 && size <= 10000) {
        return 25;
      } else if (size > 10000 && size <= 15000) {
        return 30;
      } else if (size > 15000 && size <= 20000) {
        return 35;
      } else if (size > 20000 && size <= 25000) {
        return 40;
      } else if (size > 25000 && size <= 30000) {
        return 45;
      } else if (size > 35000 && size <= 40000) {
        return 50;
      } else if (size > 40000 && size <= 45000) {
        return 55;
      } else if (size > 45000 && size <= 50000) {
        return 60;
      } else if (size > 50000 && size <= 55000) {
        return 65;
      } else {
        return 70;
      }
    }, shapeColorMappers: [
      MapColorMapper(
          from: 0, to: 10, color: Colors.red, text: '< 1000 vacinas'),
      MapColorMapper(
          from: 11,
          to: 20,
          color: Color.fromRGBO(226, 110, 110, 1.0),
          text: '1001 - 5000 vacinas'),
      MapColorMapper(
          from: 21,
          to: 25,
          color: Color.fromRGBO(34, 56, 0, 1.0),
          text: '5001 - 10000 vacinas'),
      MapColorMapper(
          from: 26,
          to: 30,
          color: Color.fromRGBO(48, 76, 7, 1.0),
          text: '10001 - 15000 vacinas'),
      MapColorMapper(
          from: 31,
          to: 35,
          color: Color.fromRGBO(65, 96, 19, 1.0),
          text: '15001 - 20000 vacinas'),
      MapColorMapper(
          from: 36,
          to: 40,
          color: Color.fromRGBO(83, 116, 34, 1.0),
          text: '20001 - 25000 vacinas'),
      MapColorMapper(
          from: 41,
          to: 45,
          color: Color.fromRGBO(103, 136, 54, 1.0),
          text: '25001 - 30000 vacinas'),
      MapColorMapper(
          from: 46,
          to: 50,
          color: Color.fromRGBO(124, 155, 77, 1.0),
          text: '30001 - 35000 vacinas'),
      MapColorMapper(
          from: 51,
          to: 55,
          color: Color.fromRGBO(147, 175, 105, 1.0),
          text: '35001 - 40000 vacinas'),
      MapColorMapper(
          from: 56,
          to: 60,
          color: Color.fromRGBO(172, 195, 136, 1.0),
          text: '40001 - 50000 vacinas'),
      MapColorMapper(
          from: 60,
          to: 65,
          color: Color.fromRGBO(223, 232, 209, 1.0),
          text: '50001 - 55000 vacinas'),
      MapColorMapper(
          from: 65,
          to: 70,
          color: Color.fromRGBO(224, 255, 229, 1.0),
          text: '+60000 vacinas'),
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
                final state = _dataFinal[index].name;
                final size = _dataFinal[index].total;

                return SeeMore(
                  size: 500,
                  height: 450,
                  legend:
                      "$state\n\n total vacinas:$size\n\n G??nero:\n Mulheres: ${_dataFinal[index].personWoman}\n Homens:${_dataFinal[index].personMan}\n\n  \n\n Vacinas:\n Sinovac/Butantan:${_dataFinal[index].butatan}\n Covishield:${_dataFinal[index].covishield}\n Pharma/Pfizer:${_dataFinal[index].pfizer}",
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
