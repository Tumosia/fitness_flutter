import 'package:flutter/material.dart';

class CategoryModel {
  String name;
  String iconPath;
  Color boxColor;

  CategoryModel(
      {required this.name, required this.iconPath, required this.boxColor});

  static List<CategoryModel> getCategories() {
    return [
      CategoryModel(
          name: 'Salad',
          iconPath: 'assets/icons/plate.svg',
          boxColor: const Color(0xFF83E5E2)),
      CategoryModel(
          name: 'Cake',
          iconPath: 'assets/icons/pancakes.svg',
          boxColor: const Color(0xFFFFD3A5)),
      CategoryModel(
          name: 'Pie',
          iconPath: 'assets/icons/pie.svg',
          boxColor: const Color.fromARGB(143, 215, 156, 239)),
      CategoryModel(
          name: 'Smoothies',
          iconPath: 'assets/icons/orange-snacks.svg',
          boxColor: const Color.fromARGB(255, 179, 237, 160)),
    ];
  }
}
