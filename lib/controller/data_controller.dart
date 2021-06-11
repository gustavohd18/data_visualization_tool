import 'dart:convert';

import 'package:data_visualization/model/state.dart';
import 'package:data_visualization/model/vaccine.dart';
import 'package:data_visualization/service/sus_service.dart';
import 'package:flutter/services.dart';
import 'package:rx_notifier/rx_notifier.dart';
import "package:collection/collection.dart";
import 'package:df/df.dart';

class DataController {
  static final DataController _singleton = DataController._internal();

  factory DataController() {
    return _singleton;
  }

  final _services = SUSService();

  final isAllData = RxNotifier<int>(1);

  final isSelectedData = RxNotifier<bool>(false);

  final vaccines = RxNotifier<List<Vaccine>>([]);

  final statesfilterMap = RxNotifier<Map<String, List<Vaccine>>>(Map());

  final statesDataMap = RxNotifier<Map<String, StateBr>>(Map());

  final statesfilterTimeMap = RxNotifier<Map<DateTime, List<Vaccine>>>(Map());

  final statesDataTimeMap = RxNotifier<Map<DateTime, List<StateBr>>>(Map());

  final statesfilterRacMap = RxNotifier<Map<String, List<Vaccine>>>(Map());

  final statesDataRacMap = RxNotifier<Map<String, List<StateBr>>>(Map());

  setIsAllData(int value) {
    isAllData.value = value;
  }

  setIsSelectedData(bool value) {
    isSelectedData.value = value;
  }

  initData() async {
    String response = await rootBundle.loadString('assets/junho.json');
    final data = await jsonDecode(response);
    vaccines.value = (data as List)
        .map((listVaccine) => Vaccine.vaccineFromJSON(listVaccine))
        .toList();

    statesfilterMap.value =
        groupBy(vaccines.value, (Vaccine obj) => obj.pacienteEnderecoUf);
    statesfilterMap.value.forEach((key, value) {
      final woman =
          value.where((element) => element.pacienteSexo == "F").length;
      final man = value.where((element) => element.pacienteSexo == "M").length;
      final size = value.length;
      final black =
          value.where((element) => element.pacienteRaca == "02").length;
      final blank =
          value.where((element) => element.pacienteRaca == "01").length;
      final pard =
          value.where((element) => element.pacienteRaca == "03").length;
      final yellow =
          value.where((element) => element.pacienteRaca == "04").length;
      final noInformation =
          value.where((element) => element.pacienteRaca == "99").length;

      final butantan = value
          .where((element) =>
              element.vacinaNome == "Covid-19-Coronavac-Sinovac/Butantan")
          .length;
      final covishield = value
          .where(
              (element) => element.vacinaNome == "Vacina Covid-19 - Covishield")
          .length;

      final astraZeneca = value
          .where((element) => element.vacinaNome == "Covid-19-AstraZeneca")
          .length;

      statesDataMap.value[key] = StateBr(
          name: key,
          personMan: man,
          personWoman: woman,
          personWhite: blank,
          personBlack: black,
          personPard: pard,
          personYellow: yellow,
          personNo: noInformation,
          butatan: butantan,
          covishield: covishield,
          pfizer: astraZeneca,
          total: size);
    });

    statesfilterTimeMap.value =
        groupBy(vaccines.value, (Vaccine obj) => obj.vacinaDataAplicacao);
    statesfilterTimeMap.value.forEach((key, value) {
      var states = groupBy(value, (Vaccine obj) => obj.pacienteEnderecoUf);
      List<StateBr> listFinalState = [];
      states.forEach((key, value) {
        final woman =
            value.where((element) => element.pacienteSexo == "F").length;
        final man =
            value.where((element) => element.pacienteSexo == "M").length;
        final size = value.length;
        final black =
            value.where((element) => element.pacienteRaca == "02").length;
        final blank =
            value.where((element) => element.pacienteRaca == "01").length;
        final pard =
            value.where((element) => element.pacienteRaca == "03").length;
        final yellow =
            value.where((element) => element.pacienteRaca == "04").length;
        final noInformation =
            value.where((element) => element.pacienteRaca == "99").length;

        final butantan = value
            .where((element) =>
                element.vacinaNome == "Covid-19-Coronavac-Sinovac/Butantan")
            .length;
        final covishield = value
            .where((element) =>
                element.vacinaNome == "Vacina Covid-19 - Covishield")
            .length;

        final astraZeneca = value
            .where((element) => element.vacinaNome == "Covid-19-AstraZeneca")
            .length;

        listFinalState.add(StateBr(
            name: key,
            personMan: man,
            personWoman: woman,
            personWhite: blank,
            personBlack: black,
            personPard: pard,
            personYellow: yellow,
            personNo: noInformation,
            butatan: butantan,
            covishield: covishield,
            pfizer: astraZeneca,
            total: size));
      });

      statesDataTimeMap.value[key] = listFinalState;
    });

    statesfilterRacMap.value =
        groupBy(vaccines.value, (Vaccine obj) => obj.pacienteRaca);
    statesfilterRacMap.value.forEach((key, value) {
      var states = groupBy(value, (Vaccine obj) => obj.pacienteEnderecoUf);
      List<StateBr> listFinalState = [];
      states.forEach((key, value) {
        final size = value.length;
        final black =
            value.where((element) => element.pacienteRaca == "02").length;
        final blank =
            value.where((element) => element.pacienteRaca == "01").length;
        final pard =
            value.where((element) => element.pacienteRaca == "03").length;
        final yellow =
            value.where((element) => element.pacienteRaca == "04").length;
        final noInformation =
            value.where((element) => element.pacienteRaca == "99").length;

        final butantan = value
            .where((element) =>
                element.vacinaNome == "Covid-19-Coronavac-Sinovac/Butantan")
            .length;
        final covishield = value
            .where((element) =>
                element.vacinaNome == "Vacina Covid-19 - Covishield")
            .length;

        final astraZeneca = value
            .where((element) => element.vacinaNome == "Covid-19-AstraZeneca")
            .length;

        listFinalState.add(StateBr(
            name: key,
            personMan: 0,
            personWoman: 0,
            personWhite: blank,
            personBlack: black,
            personPard: pard,
            personYellow: yellow,
            personNo: noInformation,
            butatan: butantan,
            covishield: covishield,
            pfizer: astraZeneca,
            total: size));
      });

      statesDataRacMap.value[key] = listFinalState;
    });

    print("Dados carregados");
  }

  Map<String, StateBr> getListVaccinesPerState() {
    return statesDataMap.value;
  }

  Map<DateTime, List<StateBr>> getListVaccinesPerDay() {
    return statesDataTimeMap.value;
  }

  Map<String, List<Vaccine>> getListVaccinesPerGenre() {
    return groupBy(vaccines.value, (Vaccine obj) => obj.pacienteSexo);
  }

  Map<String, List<Vaccine>> getListVaccinesPerName() {
    return groupBy(vaccines.value, (Vaccine obj) => obj.vacinaNome);
  }

  List<StateBr> getListVaccinesPerRac(String rac) {
    return statesDataRacMap.value[rac]!;
  }

  DataController._internal();
}
