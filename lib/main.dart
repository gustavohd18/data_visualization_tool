import 'package:data_visualization/web_plataform.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

import 'package:data_visualization/mobile_plataform.dart';

void main() {
  return runApp(MapsApp());
}

/// This widget will be the root of application.
class MapsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Maps Demo',
      home:kIsWeb ? WebPlataform() : MobilePlataform(),
    );
  }
}
