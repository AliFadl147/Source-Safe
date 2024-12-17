import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:source_safe_project/Features/dashboard/data/models/drawer_item_model.dart';
import 'package:source_safe_project/core/utils/app_colors.dart';

class InActiveDrawerItem extends StatelessWidget {
  const InActiveDrawerItem({
    super.key,
    required this.drawerItemModel,
    required this.isSvg,
    this.trailing,
    this.onTap,
  });

  final DrawerItemModel drawerItemModel;
  final bool isSvg;
  final Widget? trailing;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: isSvg
          ? SvgPicture.asset(drawerItemModel.image ?? '')
          : Icon(
              drawerItemModel.icon,
              color: AppColors.kPrimaryColor,
            ),
      title: FittedBox(
        alignment: AlignmentDirectional.centerStart,
        fit: BoxFit.scaleDown,
        child: Text(drawerItemModel.title,
            style: Theme.of(context).textTheme.titleSmall),
      ),
      trailing: trailing,
    );
  }
}

class ActiveDrawerItem extends StatelessWidget {
  const ActiveDrawerItem({
    super.key,
    required this.drawerItemModel,
    required this.isSvg,
  });

  final DrawerItemModel drawerItemModel;
  final bool isSvg;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: isSvg
          ? SvgPicture.asset(drawerItemModel.image ?? '')
          : Icon(
              drawerItemModel.icon,
              color: AppColors.kPrimaryColor,
            ),
      title: FittedBox(
        alignment: AlignmentDirectional.centerStart,
        fit: BoxFit.scaleDown,
        child: Text(drawerItemModel.title,
            style: Theme.of(context).textTheme.displaySmall),
      ),
      trailing: Container(
        width: 3.27,
        decoration: BoxDecoration(color: AppColors.kPrimaryColor),
      ),
    );
  }
}
