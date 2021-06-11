import 'package:data_visualization/controller/data_controller.dart';
import 'package:data_visualization/pages/map_days.dart';
import 'package:data_visualization/pages/map_genre.dart';
import 'package:data_visualization/pages/map_name_vaccine.dart';
import 'package:data_visualization/pages/map_rac.dart';
import 'package:data_visualization/pages/map_vaccines.dart';
import 'package:data_visualization/pages/selected.dart';
import 'package:data_visualization/widgets/checkListData.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late DataController controller;
  void loadData() {
    DataController().initData();
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Selected()),
    );
  }

  final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
    onPrimary: Colors.blue,
    primary: Colors.grey[300],
    minimumSize: Size(88, 36),
    padding: EdgeInsets.symmetric(horizontal: 16),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(2)),
    ),
  );

  @override
  void initState() {
    controller = DataController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
          Text(
            "Bem vindo ao VACINAVIZ",
            style: TextStyle(fontSize: 20),
          ),
          Text("Selecione o mês para visualização:",
              style: TextStyle(fontSize: 14)),
          CheckListData(),
          ElevatedButton(
            onPressed: () => loadData(),
            child: Text('Iniciar'),
          ),
        ]))));
  }
}

class MapData extends StatelessWidget {
  const MapData({required this.type});

  final int type;

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case 1:
        return MapTotal();
      case 2:
        return MapDays();
      case 3:
        return MapGenre(genre: "M");
      case 4:
        return MapGenre(genre: "F");
      case 5:
        return MapRac(rac: "01");
      case 6:
        return MapRac(rac: "02");
      case 7:
        return MapRac(rac: "03");
      case 8:
        return MapRac(rac: "04");
      case 9:
        return MapVaccine(name: "Covid-19-Coronavac-Sinovac/Butantan");
      case 10:
        return MapVaccine(name: "Vacina Covid-19 - Covishield");
      case 11:
        return MapVaccine(
            name: "Vacina covid-19 - BNT162b2 - BioNTech/Fosun Pharma/Pfizer");
      default:
        return MapDays();
    }
  }
}
