import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

/// This widget is the home page of the application.
class MobilePlataform extends StatefulWidget {
  /// Initialize the instance of the [MyHomePage] class.
  const MobilePlataform({Key? key}) : super(key: key);

  @override
  _MobilePlataformState createState() => _MobilePlataformState();
}

class _MobilePlataformState extends State<MobilePlataform> {
  _MobilePlataformState();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<ChartData> chartData = [
      ChartData('Branco', 25, Colors.black54),
      ChartData('Pardo', 38, Colors.blueAccent),
      ChartData('Negro', 34, Colors.red),
      ChartData('Sem identificacao', 52, Colors.green)
    ];
    return Scaffold(
        body: Center(
            child: Container(
                child: SfCircularChart(
                    legend: Legend(isVisible: true),
                    tooltipBehavior: TooltipBehavior(enable: true),
                    series: <CircularSeries>[
          // Render pie chart
          PieSeries<ChartData, String>(
              enableTooltip: true,
              dataSource: chartData,
              xValueMapper: (ChartData data, _) => data.x,
              yValueMapper: (ChartData data, _) => data.y,
              // Render the data label
              dataLabelSettings: DataLabelSettings(isVisible: true))
        ]))));
  }
}

class ChartData {
  ChartData(this.x, this.y, this.color);
  final String x;
  final double y;
  final Color color;
}
