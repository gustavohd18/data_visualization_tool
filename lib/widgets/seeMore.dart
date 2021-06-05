import 'package:data_visualization/model/vaccine.dart';
import 'package:flutter/material.dart';

class SeeMore extends StatefulWidget {
  const SeeMore({required this.vaccines, required this.legend});

  final String legend;
  final List<Vaccine> vaccines;

  @override
  _SeeMoreState createState() => _SeeMoreState();
}

class _SeeMoreState extends State<SeeMore> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 120,
        height: 120,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: Text(
                "${widget.legend}",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            Text(
              "Veja mais",
              style: TextStyle(color: Colors.white, fontSize: 20),
            )
          ],
        ));
  }
}
