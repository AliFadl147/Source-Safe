import 'package:flutter/material.dart';
import 'package:source_safe_project/Features/dashboard/data/models/switch_list_tile_items_model.dart';
import 'package:source_safe_project/core/utils/app_colors.dart';
import 'package:source_safe_project/core/utils/app_styles.dart';

class CustomSwitchListTile extends StatefulWidget {
  const CustomSwitchListTile(
      {super.key, required this.switchListTileItemsModel});

  final SwitchListTileItemsModel switchListTileItemsModel;

  @override
  State<CustomSwitchListTile> createState() => _CustomSwitchListTileState();
}

class _CustomSwitchListTileState extends State<CustomSwitchListTile> {
  bool lights = false;

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      title: FittedBox(
        alignment: AlignmentDirectional.centerStart,
        fit: BoxFit.scaleDown, 
        child: Text(
          widget.switchListTileItemsModel.title,
          style: lights
              ? AppStyles.styleBold16(context)
              : AppStyles.styleMedium16(context),
        ),
      ),
      subtitle: FittedBox(
        alignment: AlignmentDirectional.centerStart,
        fit: BoxFit.scaleDown,
        child: Text(
          widget.switchListTileItemsModel.subtitle,
          style: AppStyles.styleRegular11(context),
        ),
      ),
      value: lights,
      onChanged: (value) {
        setState(() {
          lights = value;
        });
      },
      
      thumbColor: WidgetStateProperty.resolveWith<Color>((states) {
        if (states.contains(WidgetState.hovered)) {
          if (states.contains(WidgetState.selected)) {
            return AppColors.white;
          } else {
            return AppColors.darkShadeOfCyanBlue;
          }
        }
        if (states.contains(WidgetState.selected)) {
          return AppColors.white;
        }
        return AppColors.darkShadeOfCyanBlue; 
      }),
      trackColor: WidgetStateProperty.resolveWith<Color>((states) {
        if (states.contains(WidgetState.selected)) {
          return AppColors.kPrimaryColor;
        }
        return AppColors.lightGray;
      }),
      secondary: widget.switchListTileItemsModel.widget,
    );
  }
}
