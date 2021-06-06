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
        width: 300,
        height: 300,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: Text(
                "${widget.legend}",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            TextButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
              ),
              onPressed: () {
                print("Clicked");
              },
              child: Text('TextButton'),
            )
          ],
        ));
  }
}
