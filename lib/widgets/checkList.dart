import 'package:data_visualization/controller/data_controller.dart';
import 'package:flutter/material.dart';

class CheckList extends StatefulWidget {
  const CheckList({Key? key}) : super(key: key);

  @override
  _CheckListState createState() => _CheckListState();
}

class _CheckListState extends State<CheckList> {
  bool? _isCheckedAllData = false;
  bool? _isCheckedDataPerDay = false;
  bool? _isCheckedGenreMan = false;
  bool? _isCheckedGenreWoman = false;
  bool? _isCheckedAllBlack = false;
  bool? _isCheckedAllBlank = false;
  bool? _isCheckedAllYellow = false;
  bool? _isCheckedAllPard = false;

  void setType() {
    if (_isCheckedAllData == true) {
      _isCheckedDataPerDay = false;
      _isCheckedGenreMan = false;
      _isCheckedGenreWoman = false;
      _isCheckedAllBlack = false;
      _isCheckedAllBlank = false;
      _isCheckedAllYellow = false;
      _isCheckedAllPard = false;
      DataController().setIsAllData(1);
    } else if (_isCheckedDataPerDay == true) {
      _isCheckedAllData = false;
      _isCheckedGenreMan = false;
      _isCheckedGenreWoman = false;
      _isCheckedAllBlack = false;
      _isCheckedAllBlank = false;
      _isCheckedAllYellow = false;
      _isCheckedAllPard = false;
      DataController().setIsAllData(2);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(5),
        child: Container(
            height: 60,
            child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              children: [
                Container(
                  width: 150,
                  height: 60,
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.black)),
                  child: CheckboxListTile(
                    title: const Text('Total dias'),
                    value: _isCheckedAllData,
                    onChanged: (bool? value) {
                      setState(() {
                        _isCheckedAllData = value;
                        setType();
                      });
                    },
                  ),
                ),
                Container(
                  width: 150,
                  height: 60,
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.black)),
                  child: CheckboxListTile(
                    title: const Text('Por dias'),
                    value: _isCheckedDataPerDay,
                    onChanged: (bool? value) {
                      setState(() {
                        _isCheckedDataPerDay = value;
                        setType();
                      });
                    },
                  ),
                ),
                Container(
                  width: 150,
                  height: 60,
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.black)),
                  child: CheckboxListTile(
                    title: const Text('Masculino'),
                    value: _isCheckedGenreMan,
                    onChanged: (bool? value) {
                      setState(() {
                        _isCheckedGenreMan = value;
                      });
                    },
                  ),
                ),
                Container(
                  width: 150,
                  height: 60,
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.black)),
                  child: CheckboxListTile(
                    title: const Text('Feminino'),
                    value: _isCheckedGenreWoman,
                    onChanged: (bool? value) {
                      setState(() {
                        _isCheckedGenreWoman = value;
                      });
                    },
                  ),
                ),
                Container(
                  width: 150,
                  height: 60,
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.black)),
                  child: CheckboxListTile(
                    title: const Text('Branca'),
                    value: _isCheckedAllBlank,
                    onChanged: (bool? value) {
                      setState(() {
                        _isCheckedAllBlank = value;
                      });
                    },
                  ),
                ),
                Container(
                  width: 150,
                  height: 60,
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.black)),
                  child: CheckboxListTile(
                    title: const Text('Preta'),
                    value: _isCheckedAllBlack,
                    onChanged: (bool? value) {
                      setState(() {
                        _isCheckedAllBlack = value;
                      });
                    },
                  ),
                ),
                Container(
                  width: 150,
                  height: 60,
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.black)),
                  child: CheckboxListTile(
                    title: const Text('Parda'),
                    value: _isCheckedAllPard,
                    onChanged: (bool? value) {
                      setState(() {
                        _isCheckedAllPard = value;
                      });
                    },
                  ),
                ),
                Container(
                  width: 150,
                  height: 60,
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.black)),
                  child: CheckboxListTile(
                    title: const Text('Amarela'),
                    value: _isCheckedAllYellow,
                    onChanged: (bool? value) {
                      setState(() {
                        _isCheckedAllYellow = value;
                      });
                    },
                  ),
                ),
              ],
            )));
  }
}
