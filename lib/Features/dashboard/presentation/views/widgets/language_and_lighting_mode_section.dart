import 'package:flutter/material.dart';
import 'package:source_safe_project/Features/dashboard/data/models/switch_list_tile_items_model.dart';
import 'package:source_safe_project/Features/dashboard/presentation/views/widgets/custom_switch_list_tile.dart';
import 'package:source_safe_project/core/utils/app_colors.dart';
import 'package:source_safe_project/generated/l10n.dart';
import 'package:intl/intl.dart';

class LanguageAndLightingModeSection extends StatelessWidget {
  const LanguageAndLightingModeSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomSwitchListTile(
          switchListTileItemsModel: SwitchListTileItemsModel(
              title: S.of(context).languageChange,
              subtitle: S.of(context).switchLanguage,
              widget: Icon(
                Icons.language,
                color: AppColors.kPrimaryColor,
              )),
          index: 0,
          lights: Intl.getCurrentLocale() == 'ar' ? true : false,
        ),
        CustomSwitchListTile(
          switchListTileItemsModel: SwitchListTileItemsModel(
              title: S.of(context).lightingMode,
              subtitle: S.of(context).switchTheme,
              widget: Icon(
                Icons.brightness_6,
                color: AppColors.kPrimaryColor,
              )),
          index: 1,
          lights:
              Theme.of(context).brightness == Brightness.dark ? true : false,
        ),
      ],
    );
  }
}
