

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BarProgress extends StatelessWidget {
  final int valor;

  BarProgress({required this.valor});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(5, (index) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 2.0),
          height: 6.0,
          width: 10.w,
          color: index < valor ? Colors.green : Colors.grey[300],
        );
      }),
    );
  }
}