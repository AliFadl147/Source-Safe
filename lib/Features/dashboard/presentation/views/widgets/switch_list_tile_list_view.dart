import 'package:flutter/material.dart';
import 'package:source_safe_project/Features/authentication/presentation/views/widgets/email_and_password_fields_section.dart';
import 'package:source_safe_project/Features/dashboard/data/models/switch_list_tile_items_model.dart';
import 'package:source_safe_project/Features/dashboard/presentation/views/widgets/custom_switch_list_tile.dart';
import 'package:source_safe_project/core/utils/app_colors.dart';
import 'package:source_safe_project/generated/l10n.dart';

class SwitchListTileListView extends StatefulWidget {
  const SwitchListTileListView({
    super.key,
  });

  @override
  State<SwitchListTileListView> createState() => _SwitchListTileListViewState();
}

class _SwitchListTileListViewState extends State<SwitchListTileListView> {
  int activeIndex = 0;

  // final List<SwitchListTileItemsModel> items = [
  //   SwitchListTileItemsModel(
  //       title: S.of(context).languageChange,
  //       subtitle: S.of(context).switchLanguage,
  //       widget: Icon(
  //         Icons.language,
  //         color: AppColors.kPrimaryColor,
  //       )),
  //   SwitchListTileItemsModel(
  //       title: S.of(context).lightingMode,
  //       subtitle: S.of(context).switchTheme,
  //       widget: Icon(
  //         Icons.brightness_6,
  //         color: AppColors.kPrimaryColor,
  //       )),
  // ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(); /*SliverList.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(top: 20),
          child: CustomSwitchListTile(switchListTileItemsModel: items[index], index: index,),
        );
      },
    );*/
  }
}
