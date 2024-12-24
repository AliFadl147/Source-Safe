import 'package:flutter/material.dart';
import 'package:source_safe_project/Features/dashboard/data/models/drawer_item_model.dart';
import 'package:source_safe_project/Features/dashboard/presentation/views/widgets/active_and_inactive_item.dart';
import 'package:source_safe_project/Features/dashboard/presentation/views/widgets/add_file_alert_dialog.dart';
import 'package:source_safe_project/Features/dashboard/presentation/views/widgets/custom_alert_dialog.dart';
import 'package:source_safe_project/core/utils/app_colors.dart';
import 'package:source_safe_project/core/utils/app_images.dart';
import 'package:source_safe_project/core/utils/functions.dart';
import 'package:source_safe_project/generated/l10n.dart';

class CreateGroupAndAddFilesAndLogoutSection extends StatefulWidget {
  const CreateGroupAndAddFilesAndLogoutSection({
    super.key,
  });

  @override
  State<CreateGroupAndAddFilesAndLogoutSection> createState() =>
      _CreateGroupAndAddFilesAndLogoutSectionState();
}

class _CreateGroupAndAddFilesAndLogoutSectionState
    extends State<CreateGroupAndAddFilesAndLogoutSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
            child: SizedBox(
          height: 20,
        )),
        InActiveDrawerItem(
          isSvg: false,
          drawerItemModel: DrawerItemModel(
              title: S.of(context).createAGroup, icon: Icons.group_add_rounded),
          trailing: Icon(
            Icons.add_circle_outline_rounded,
            color: AppColors.kPrimaryColor,
          ),
          onTap: () {
            //selectedindexes.clear();
            showDialog(
                context: context,
                builder: (BuildContext context) => CustomAlertDialog());
          },
        ),
        InActiveDrawerItem(
          isSvg: false,
          drawerItemModel: DrawerItemModel(
              title: S.of(context).addFile, icon: Icons.note_add_rounded),
          trailing: Icon(
            Icons.add_circle_outline_rounded,
            color: AppColors.kPrimaryColor,
          ),
          onTap: () {
            showDialog(
                context: context,
                builder: (BuildContext context) => Addfilealertdialog());
          },
        ),
        SizedBox(
          height: 12,
        ),
        InActiveDrawerItem(
          isSvg: true,
          drawerItemModel: DrawerItemModel(
              title: S.of(context).logoutAccount, image: Assets.imagesLogout),
        ),
        SizedBox(
          height: 24,
        )
      ],
    );
  }
}
