import 'package:data_visualization/controller/data_controller.dart';
import 'package:flutter/material.dart';

class CheckListData extends StatefulWidget {
  const CheckListData({Key? key}) : super(key: key);

  @override
  _CheckListDataState createState() => _CheckListDataState();
}

class _CheckListDataState extends State<CheckListData> {
  bool? _isJanuary = true;
  bool? _isJune = false;

  void setType() {
    if (_isJanuary == true) {
      _isJune = false;
      DataController().setSelectedData(0);
    } else if (_isJune == true) {
      _isJanuary = false;
      DataController().setSelectedData(1);
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
                    title: const Text('Janeiro'),
                    value: _isJanuary,
                    onChanged: (bool? value) {
                      setState(() {
                        _isJanuary = value;
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
                    title: const Text('Junho'),
                    value: _isJune,
                    onChanged: (bool? value) {
                      setState(() {
                        _isJune = value;
                        setType();
                      });
                    },
                  ),
                ),
              ],
            )));
  }
}
