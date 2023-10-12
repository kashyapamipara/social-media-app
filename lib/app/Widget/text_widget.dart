import 'package:flutter/cupertino.dart';

import '../Constants/color.dart';

class TextWidget extends StatelessWidget {
  Color? textColor;
  String text;
  int? maxLine;

  TextWidget({
    Key? key,
    required this.text,
    this.textColor,
    this.maxLine,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: textColor ?? AppColors.BLACK_COLOR,
          fontSize: MediaQuery.textScaleFactorOf(context) * 15),
      maxLines: maxLine ?? 1,
    );
  }
}
