// ignore_for_file: must_be_immutable

/*
* User      li14
* Developer KISHOR PARMAR
* Company   www.logisticinfotech.com
* Project   Service-klick
* Date      09/07/21 1:46 PM
* About
* Resource
* */

import 'package:flutter/material.dart';

class LoadingProgressBar extends StatelessWidget {
  Color? color = Colors.white;
  Color? indicatorColor;
  double? width = 5.0;
  double? height = 5.0;
  bool isDisMissile = false;

  LoadingProgressBar(
      {super.key, this.color,
      this.width,
      this.height,
      required this.isDisMissile,
      this.indicatorColor});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => isDisMissile,
      child: Container(
        color: color,
        width: width,
        height: height,
        child: CircularProgressIndicator(color: indicatorColor),
      ),
    );
  }
}
