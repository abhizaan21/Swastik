import 'package:swastik_app/data/config_size.dart';
import 'package:swastik_app/data/constants.dart';
import 'package:swastik_app/widget/activity_chart.dart';
import 'package:swastik_app/widget/heading.dart';
import 'package:swastik_app/widget/hourly_chart.dart';
import 'package:swastik_app/widget/weekly_chart.dart';
import 'package:flutter/material.dart';



class MetricScreen extends StatelessWidget {

  // Data we need to draw two bar graphs.
  final List<int> weeklyData = [10, 12, 4, 16, 20, 16, 14];
  final List<int> hourlyData = [
    5,7,10,11,17,18,14,15,12,11,8,7,11,19,6,8,10,12,18,16,14,17,11,13
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.blockSizeVertical * 82,
      width: double.infinity,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
        color: CustomColors.kBackgroundColor,
      ),
      child: Column(
        children: [
          const HeadingWidget(
            text1: 'EXERCISE',
            text2: '',
          ),
          const ActivityChart(),
          const HeadingWidget(
            text1: 'GOAL COMPLIANCE',
            text2: '',
          ),
          WeeklyBarChartWidget(weeklyData: weeklyData, maximumValueOnYAxis: 22.0),
          const HeadingWidget(
            text1: 'AVG EXERCISE',
            text2: '',
          ),
          HourlyBarChartWidget(hourlyData: hourlyData, maximumValueOnYAxis: 22.0,)
        ],
      ),
    );
  }
}