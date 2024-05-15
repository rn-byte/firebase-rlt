import 'package:flutter/material.dart';

class CategoryModel {
  String name;
  Color boxColor;
  String iconPath;

  CategoryModel({
    required this.name,
    required this.boxColor,
    required this.iconPath,
  });

  static List<CategoryModel> getCategory() {
    List<CategoryModel> categories = [];

    categories.add(CategoryModel(
      name: "Rice",
      boxColor: const Color(0xff9DCEFF),
      iconPath: 'assets/images/rice.png',
    ));
    categories.add(CategoryModel(
      name: "Wheat",
      boxColor: const Color(0xffEEA4CE),
      iconPath: 'assets/images/wheat.png',
    ));
    categories.add(CategoryModel(
      name: "Pulses",
      boxColor: const Color(0xff9DCEFF),
      iconPath: 'assets/images/pulses.png',
    ));
    categories.add(CategoryModel(
      name: "Vegetables",
      boxColor: const Color(0xffEEA4CE),
      iconPath: 'assets/images/vegetables.png',
    ));
    categories.add(CategoryModel(
      name: "Fruits",
      boxColor: const Color(0xff9DCEFF),
      iconPath: 'assets/images/fruits.png',
    ));
    categories.add(CategoryModel(
      name: "Spices",
      boxColor: const Color(0xffEEA4CE),
      iconPath: 'assets/images/spices.png',
    ));
    categories.add(CategoryModel(
      name: "Dairy Product",
      boxColor: const Color(0xff9DCEFF),
      iconPath: 'assets/images/dairy.png',
    ));

    return categories;
  }
}
