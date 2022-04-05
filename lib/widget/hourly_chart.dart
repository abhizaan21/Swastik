import 'package:swastik_app/data/constants.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class HourlyBarChartWidget extends StatelessWidget {
  final List<int> hourlyData;
  final double
  maximumValueOnYAxis;
  HourlyBarChartWidget({required this.hourlyData, required this.maximumValueOnYAxis});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 3,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          color: Colors.white,
          elevation: 0,
          child: Container(
            margin: const EdgeInsets.only(top: 15.0),
            child: BarChart(
                mainBarData()
            ),
          ),
        ),
      ),
    );
  }

  BarChartGroupData makeGroupData(int x, double y) {
    return BarChartGroupData(x: x, barRods: [
      BarChartRodData(
        y: y,
        color: CustomColors.kLightPinkColor, //
        width: 7.0,
      )
    ]);
  }

  // Complete list of bars returns from here.
  List<BarChartGroupData> showingGroups() {
    return List.generate(hourlyData.length, (index) {
      return makeGroupData(index,
          hourlyData[index].toDouble());
    });
  }

  FlTitlesData _buildAxes() {
    return FlTitlesData(
        show: true,
        leftTitles: SideTitles(showTitles: false),
        bottomTitles: SideTitles(
            showTitles: true,
            textStyle: TextStyle(
                color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 14),
            margin: 12,
            getTitles: (double value) {
              switch (value.toInt()) {
                case 1:
                  return '12 AM';
                case 6:
                  return '6 AM';
                case 11:
                  return '12 PM';
                case 16:
                  return '6 PM';
                case 22:
                  return '11 PM';
                default:
                  return '';
              }
            }));
  }

  BarChartData mainBarData() {
    return BarChartData(
      maxY: maximumValueOnYAxis,
      borderData: FlBorderData(
        show: false,
      ),
      groupsSpace: 7.5,
      titlesData: _buildAxes(), // To build x and y axis.
      alignment: BarChartAlignment.center, // To put it in center
      barGroups: showingGroups(), // This function would draw the actual bars!
    );
  }
}

