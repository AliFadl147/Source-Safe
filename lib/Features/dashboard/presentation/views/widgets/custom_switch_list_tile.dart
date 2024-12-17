import 'package:flutter/material.dart';
import 'package:source_safe_project/Features/dashboard/data/models/switch_list_tile_items_model.dart';
import 'package:source_safe_project/core/manager/change_lang_cubit/change_lang_cubit.dart';
import 'package:source_safe_project/core/manager/change_mode_cubit/change_mode_cubit.dart';
import 'package:source_safe_project/core/utils/app_colors.dart';

class CustomSwitchListTile extends StatefulWidget {
  const CustomSwitchListTile(
      {super.key,
      required this.switchListTileItemsModel,
      required this.index,
      required this.lights});

  final SwitchListTileItemsModel switchListTileItemsModel;
  final int index;
  final bool lights;

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
        child: Text(widget.switchListTileItemsModel.title,
            style: lights
                ? Theme.of(context).textTheme.displaySmall
                : Theme.of(context).textTheme.titleSmall),
      ),
      subtitle: FittedBox(
        alignment: AlignmentDirectional.centerStart,
        fit: BoxFit.scaleDown,
        child: Text(widget.switchListTileItemsModel.subtitle,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  fontSize: 11,
                )),
      ),
      value: widget.lights,
      onChanged: (value) {
        setState(() {
          if (widget.index == 0) {
            ChangeLangCubit.get(context).changeLanguage();
          } else if (widget.index == 1) {
            ChangeModeCubit.get(context).changeAppMode();
          }
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
