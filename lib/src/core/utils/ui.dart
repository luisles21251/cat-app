import 'package:cat_flutter_project/src/core/settings/app_colors.dart';
import 'package:flutter/material.dart';

InputBorder? customOutlineInputBorder(bool enable) {
  if(enable) {
    return const OutlineInputBorder(
        borderRadius:
        BorderRadius.all(Radius.circular(10)),
        borderSide: BorderSide(
            color: AppColors.pBlack, width: 1.0));
  }

  return const OutlineInputBorder(
      borderRadius:
      BorderRadius.all(Radius.circular(10)),
      borderSide: BorderSide(
          color: Color(0xFFDBDBDB), width: 1.0));
}