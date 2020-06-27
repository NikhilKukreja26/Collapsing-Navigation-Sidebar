import 'package:flutter/material.dart';

class NavigationModel {
  String title;
  IconData iconData;

  NavigationModel({
    @required this.title,
    @required this.iconData,
  });
}

List<NavigationModel> navigationItems = [
  NavigationModel(
    title: 'Dashboard',
    iconData: Icons.insert_chart,
  ),
  NavigationModel(
    title: 'Error',
    iconData: Icons.error,
  ),
  NavigationModel(
    title: 'Search',
    iconData: Icons.search,
  ),
  NavigationModel(
    title: 'Notifications',
    iconData: Icons.notifications,
  ),
  NavigationModel(
    title: 'Settings',
    iconData: Icons.settings,
  ),
];
