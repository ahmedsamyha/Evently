import 'package:flutter/material.dart';

import '../model/category_model.dart';

class MyProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.light;
  int selectedIndex = 0;


  void changeTheme() {
    if (themeMode == ThemeMode.light) {
      themeMode = ThemeMode.dark;
    } else {
      themeMode = ThemeMode.light;
    }
    print('Theme changed: $themeMode'); // Debugging log
    notifyListeners();
  }
  List<CategoryModel> categoryList = [
    CategoryModel(
        categoryName: 'all',
        categoryTitle: "all",
        categoryIcon: Icons.done_all),
    CategoryModel(
        categoryName: 'sport',
        categoryTitle: "sport",
        categoryIcon: Icons.directions_bike_outlined),
    CategoryModel(
        categoryName: 'birthday',
        categoryTitle: "birthday",
        categoryIcon: Icons.cake_outlined),
    CategoryModel(
        categoryName: 'meeting',
        categoryTitle: "meeting",
        categoryIcon: Icons.business_rounded),
    CategoryModel(
        categoryName: 'gaming',
        categoryTitle: "gaming",
        categoryIcon: Icons.games_outlined),
    CategoryModel(
        categoryName: 'eating',
        categoryTitle: "eating",
        categoryIcon: Icons.fastfood_outlined),
    CategoryModel(
        categoryName: 'holiday',
        categoryTitle: "holiday",
        categoryIcon: Icons.holiday_village_outlined),
    CategoryModel(
        categoryName: 'exhibition',
        categoryTitle: "exhibition",
        categoryIcon: Icons.museum_outlined),
    CategoryModel(
        categoryName: 'workshop',
        categoryTitle: "work_shop",
        categoryIcon: Icons.work_outline),
    CategoryModel(
        categoryName: 'bookclub',
        categoryTitle: "book_club",
        categoryIcon: Icons.menu_book_outlined),
  ];
  void changeEventImage(int index){
  selectedIndex = index;
  notifyListeners();
  }
}
