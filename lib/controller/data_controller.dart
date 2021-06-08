import 'package:data_visualization/model/vaccine.dart';
import 'package:data_visualization/service/sus_service.dart';
import 'package:rx_notifier/rx_notifier.dart';
import "package:collection/collection.dart";

class DataController {
  static final DataController _singleton = DataController._internal();

  factory DataController() {
    return _singleton;
  }

  final _services = SUSService();

  final isAllData = RxNotifier<int>(1);

  final isSelectedData = RxNotifier<bool>(false);

  final vaccines = RxNotifier<List<Vaccine>>([]);

  setIsAllData(int value) {
    isAllData.value = value;
  }

  setIsSelectedData(bool value) {
    isSelectedData.value = value;
  }

  initData() async {
    vaccines.value = await _services.getVaccines();
  }

  Map<String, List<Vaccine>> getListVaccinesPerState() {
    return groupBy(vaccines.value, (Vaccine obj) => obj.pacienteEnderecoUf);
  }

  Map<DateTime, List<Vaccine>> getListVaccinesPerDay() {
    return groupBy(vaccines.value, (Vaccine obj) => obj.vacinaDataAplicacao);
  }

  Map<String, List<Vaccine>> getListVaccinesPerGenre() {
    return groupBy(vaccines.value, (Vaccine obj) => obj.pacienteSexo);
  }

  Map<String, List<Vaccine>> getListVaccinesPerRac() {
    return groupBy(vaccines.value, (Vaccine obj) => obj.pacienteRaca);
  }

  DataController._internal();
}
