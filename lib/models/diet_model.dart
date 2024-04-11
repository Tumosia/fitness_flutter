import 'package:flutter/material.dart';

class DietModel {
  String name;
  String iconPath;
  String level;
  String duration;
  String calorie;
  Color boxColor;
  bool viewIsSelected;

  DietModel(
      {required this.name,
      required this.iconPath,
      required this.level,
      required this.duration,
      required this.calorie,
      required this.boxColor,
      required this.viewIsSelected});

  static List<DietModel> getDiets() {
    return [
      DietModel(
          name: 'Honey Pancake',
          iconPath: 'assets/icons/honey-pancakes.svg',
          level: 'Easy',
          duration: '30mins',
          calorie: '180kCal',
          viewIsSelected: false,
          boxColor: const Color(0xff9DCEFF)),
      DietModel(
          name: 'Canai Bread',
          iconPath: 'assets/icons/canai-bread.svg',
          level: 'Easy',
          duration: '20mins',
          calorie: '230kCal',
          viewIsSelected: true,
          boxColor: const Color(0xffEEA4CE)),
    ];
  }
}
