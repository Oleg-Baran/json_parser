import 'dart:math';

import 'package:flutter/material.dart';
import 'package:todo_app/util/constants.dart';
import 'package:todo_app/data/models/lessons.dart';

class Common {
  static InputDecoration getInputDecoration(String hintText, {suffixIcon}) {
    const borderRadius = BorderRadius.all(Radius.circular(8.0));
    const borderWidthValue = 1.0;

    const errorBorder = OutlineInputBorder(
      borderRadius: borderRadius,
      borderSide: BorderSide(color: mainColor, width: borderWidthValue),
    );

    const defaultBorder = OutlineInputBorder(
      borderRadius: borderRadius,
      borderSide: BorderSide(color: mainColor, width: borderWidthValue),
    );

    return InputDecoration(
      errorStyle: const TextStyle(color: redColor),
      enabledBorder: defaultBorder,
      focusedBorder: defaultBorder,
      border: defaultBorder,
      focusedErrorBorder: errorBorder,
      errorBorder: errorBorder,
      filled: true,
      hintStyle: const TextStyle(
          color: mainColor, fontSize: 16, fontWeight: FontWeight.w400),
      hintText: hintText,
      contentPadding: const EdgeInsets.symmetric(vertical: 17, horizontal: 15),
      suffixIcon: suffixIcon,
    );
  }

  static void hideKeyboard(context) {
    FocusScope.of(context).unfocus();
  }

  static Icon getIconsForItem(String itemLvl) {
    switch (itemLvl) {
      case "Beginner":
        return const Icon(size: 40, Icons.ac_unit_rounded, color: Colors.white);
      case "Intermediate":
        return const Icon(size: 40, Icons.camera, color: Colors.white);
      case "Advanced":
        return const Icon(
            size: 40, Icons.account_balance_sharp, color: Colors.white);
      default:
        return const Icon(size: 40, Icons.car_rental, color: Colors.white);
    }
  }

  static _getRandomLvl() {
    List levels = ["Beginner", "Intermediate", "Advanced"];
    int randomLvl = Random().nextInt(levels.length);
    return levels[randomLvl];
  }

  static double _getIndicatorValue() {
    switch (_getRandomLvl()) {
      case 'Beginner':
        return 0.33;
      case 'Intermediate':
        return 0.66;
      case 'Advanced':
        return 1;
      default:
        return 0.33;
    }
  }

  static _getPrice() {
    switch (_getRandomLvl()) {
      case 'Beginner':
        return 20;
      case 'Intermediate':
        return 30;
      case 'Advanced':
        return 50;
      default:
        return 20;
    }
  }

  static LessonsItem getRandomItem(String title) {
    LessonsItem item = LessonsItem(
      title: title,
      level: _getRandomLvl(),
      indicatorValue: _getIndicatorValue(),
      price: _getPrice(),
      content: "Content content content",
    );
    return item;
  }
}
