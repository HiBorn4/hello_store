import 'package:flutter/material.dart';

class AppColors {
  static const primaryGreen = Color(0xFF007E33);
  static const secondaryGreen = Color(0xFFE7F7ED);
  static const darkText = Color(0xFF191919);
  static const mediumText = Color(0xFF666666);
  static const lightText = Color(0xFF999999);
  static const borderColor = Color(0xFFE8E8E8);
  static const ratingStar = Color(0xFFFFA500);
  static const white = Color(0xFFFFFFFF);
}

class AppTextStyles {
  static TextStyle title(BuildContext context) => TextStyle(
    fontSize: MediaQuery.of(context).size.height * 0.025,
    fontWeight: FontWeight.bold,
    color: AppColors.darkText,
  );

  static TextStyle body(BuildContext context) => TextStyle(
    fontSize: MediaQuery.of(context).size.height * 0.016,
    color: AppColors.mediumText,
  );

  static TextStyle price(BuildContext context) => TextStyle(
    fontSize: MediaQuery.of(context).size.height * 0.018,
    fontWeight: FontWeight.bold,
    color: AppColors.darkText,
  );
}
