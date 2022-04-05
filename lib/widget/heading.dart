import 'package:swastik_app/data/constants.dart';
import 'package:swastik_app/data/config_size.dart';
import 'package:flutter/material.dart';

class HeadingWidget extends StatelessWidget {
  final String text1;
  final String text2;
  const HeadingWidget({required this.text2, required this.text1});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.blockSizeHorizontal * 90,
      margin: EdgeInsets.symmetric(vertical: SizeConfig.blockSizeVertical * 2),
      child: Row(
        children: [
          Text(
            text1,
            style: const TextStyle(
                color: CustomColors.kPrimaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 20),
          ),
          Expanded(child: Container()),
          Text(
            text2,
            style: const TextStyle(
                color: CustomColors.kLightColor,
                fontWeight: FontWeight.bold,
                fontSize: 16),
          )
        ],
      ),
    );
  }
}