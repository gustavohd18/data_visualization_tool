import 'package:data_visualization/controller/data_controller.dart';
import 'package:data_visualization/model/state.dart';
import 'package:data_visualization/model/vaccine.dart';
import 'package:data_visualization/widgets/seeMore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:syncfusion_flutter_maps/maps.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import "package:collection/collection.dart";
import 'package:intl/intl.dart';

class MapDays extends StatefulWidget {
  const MapDays();

  @override
  _MapDaysState createState() => _MapDaysState();
}

class _MapDaysState extends State<MapDays> {
  _MapDaysState();

  late Map<DateTime, List<StateBr>> _data;
  late List<StateBr> _dataFinal;
  late MapShapeSource _mapSource;
  DateTime _min = DateTime(2008, 01, 01);
  DateTime _max = DateTime(2018, 01, 01);
  DateTime _value = DateTime(2012, 01, 01);

  @override
  void initState() {
    final data = DataController().getListVaccinesPerDay();
    var newMap2 = data;

    _min = newMap2.keys.min;
    _max = newMap2.keys.max;
    _value = newMap2.keys.min;

    _data = newMap2;

    _dataFinal =
        _data.entries.firstWhere((element) => element.key == _value).value;

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
        child: Column(children: [
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
                  final state = _dataFinal[index].name;
                  final size = _dataFinal[index].total;
                  final woman = _dataFinal[index].personWoman;
                  final man = _dataFinal[index].personMan;
                  final black = _dataFinal[index].personBlack;
                  final blank = _dataFinal[index].personWhite;
                  final pard = _dataFinal[index].personPard;
                  final yellow = _dataFinal[index].personYellow;
                  final noInformation = _dataFinal[index].personNo;

                  final butantan = _dataFinal[index].butatan;
                  final covishield = _dataFinal[index].covishield;

                  final astraZeneca = _dataFinal[index].pfizer;
                  return SeeMore(
                    size: 550,
                    height: 500,
                    legend:
                        "$state\n\n total vacinas:$size\n\n Gênero:\n Mulheres: $woman\n Homens:$man \n\n Raça:\n Branca: $blank\n Preta: $black\n Parda: $pard \n Amarela: $yellow \n Não informado: $noInformation \n\n Vacinas:\n Sinovac/Butantan:$butantan\n Covishield:$covishield\n Pharma/Pfizer:$astraZeneca",
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
      )),
      SfSlider(
        min: _min,
        max: _max,
        value: _value,
        interval: 1,
        enableTooltip: true,
        dateIntervalType: DateIntervalType.days,
        dateFormat: DateFormat.yMEd(),
        onChanged: (dynamic newValue) {
          setState(() {
            _value = newValue;
            _value = DateTime(_value.year, _value.month, _value.day);
            _dataFinal = _data.entries
                .firstWhere((element) =>
                    element.key.day == _value.day &&
                    element.key.month == _value.month &&
                    element.key.year == _value.year)
                .value;
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
          });
        },
      )
    ]));
  }
}
