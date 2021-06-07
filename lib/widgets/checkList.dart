import 'package:flutter/material.dart';

class CheckList extends StatefulWidget {
  const CheckList({Key? key}) : super(key: key);

  @override
  _CheckListState createState() => _CheckListState();
}

class _CheckListState extends State<CheckList> {
  bool? _isChecked = false;
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
                    value: _isChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        _isChecked = value;
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
                    value: _isChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        _isChecked = value;
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
                    value: _isChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        _isChecked = value;
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
                    value: _isChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        _isChecked = value;
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
                    value: _isChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        _isChecked = value;
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
                    value: _isChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        _isChecked = value;
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
                    value: _isChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        _isChecked = value;
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
                    value: _isChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        _isChecked = value;
                      });
                    },
                  ),
                ),
              ],
            )));
  }
}
