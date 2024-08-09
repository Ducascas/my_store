import 'package:flutter/material.dart';
import 'package:my_store/core/constants.dart';

const List<BottomNavigationBarItem> bottomNavBarItems = [
  BottomNavigationBarItem(
    icon: Icon(
      Icons.home,
      size: 30,
    ),
    label: AppConstants.products,
  ),
  BottomNavigationBarItem(
    icon: Icon(
      Icons.favorite,
      size: 30,
    ),
    label: AppConstants.favorites,
  ),
  BottomNavigationBarItem(
    icon: Icon(
      Icons.person,
      size: 30,
    ),
    label: AppConstants.profile,
  ),
];
