import 'package:data_visualization/model/vaccine.dart';
import 'package:flutter/material.dart';

class SeeMore extends StatefulWidget {
  const SeeMore(
      {required this.vaccines,
      required this.legend,
      required this.state,
      required this.size,
      required this.height});

  final double size;
  final double height;
  final String legend;
  final List<Vaccine> vaccines;
  final String state;

  @override
  _SeeMoreState createState() => _SeeMoreState();
}

class _SeeMoreState extends State<SeeMore> {
  late int size;
  @override
  void initState() {
    size = widget.vaccines
        .where((element) => element.pacienteEnderecoUf == widget.state)
        .length;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: widget.size,
        height: widget.height,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: Text(
                "${widget.legend}",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ],
        ));
  }
}
