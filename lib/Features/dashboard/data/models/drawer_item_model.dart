import 'package:flutter/material.dart';

class DrawerItemModel {
  final String title;
  final String? image;
  final IconData? icon;

  const DrawerItemModel({
    required this.title,
    this.image,
    this.icon,
  });
}
