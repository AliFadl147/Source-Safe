import 'package:flutter/material.dart';
import 'package:source_safe_project/Features/dashboard/data/models/switch_list_tile_items_model.dart';
import 'package:source_safe_project/Features/dashboard/presentation/views/widgets/custom_switch_list_tile.dart';
import 'package:source_safe_project/core/utils/app_colors.dart';

class SwitchListTileListView extends StatefulWidget {
  const SwitchListTileListView({
    super.key,
  });

  @override
  State<SwitchListTileListView> createState() => _SwitchListTileListViewState();
}

class _SwitchListTileListViewState extends State<SwitchListTileListView> {
  int activeIndex = 0;

  final List<SwitchListTileItemsModel> items = [
    SwitchListTileItemsModel(
        title: 'Language change',
        subtitle: 'Switch Language',
        widget: Icon(
          Icons.language,
          color: AppColors.kPrimaryColor,
        )),
    SwitchListTileItemsModel(
        title: 'Lighting mode      ',
        subtitle: 'Switch Theme',
        widget: Icon(
          Icons.brightness_6,
          color: AppColors.kPrimaryColor,
        )),
  ];
  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(top: 20),
          child: CustomSwitchListTile(switchListTileItemsModel: items[index]),
        );
      },
    );
  }
}
