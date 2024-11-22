import 'package:flutter/material.dart';
import 'package:source_safe_project/Features/dashboard/data/models/drawer_item_model.dart';
import 'package:source_safe_project/Features/dashboard/presentation/views/widgets/active_and_inactive_item.dart';

class DrawerItem extends StatelessWidget {
  const DrawerItem(
      {super.key, required this.drawerItemModel, required this.isActive});

  final DrawerItemModel drawerItemModel;
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return isActive
        ? ActiveDrawerItem(drawerItemModel: drawerItemModel)
        : InActiveDrawerItem(drawerItemModel: drawerItemModel);
  }
}
