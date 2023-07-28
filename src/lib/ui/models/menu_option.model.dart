import 'package:flutter/material.dart' show IconData, Widget;

class MenuOptionModel {
  MenuOptionModel({
    required this.icon,
    required this.name,
    required this.route,
    required this.view,
  });

  final IconData icon;
  final String name;
  final String route;
  final Widget view;
}
