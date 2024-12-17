import 'package:flutter/material.dart';
import 'package:source_safe_project/Features/dashboard/data/models/drawer_item_model.dart';
import 'package:source_safe_project/Features/dashboard/data/models/user_info_model.dart';
import 'package:source_safe_project/Features/dashboard/presentation/views/widgets/active_and_inactive_item.dart';
import 'package:source_safe_project/Features/dashboard/presentation/views/widgets/user_info_list_tile.dart';
import 'package:source_safe_project/core/utils/app_images.dart';
import 'package:source_safe_project/generated/l10n.dart';

class UserInfoAndDashboardDrawerItemSection extends StatelessWidget {
  const UserInfoAndDashboardDrawerItemSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        UserInfoListTile(
          userInfoModel: UserInfoModel(
              image: Assets.imagesAvatar3,
              title: 'Lekan Okeowo',
              subTitle: 'demo@gmail.com'),
        ),
        SizedBox(
          height: 8,
        ),
        ActiveDrawerItem(
          isSvg: true,
          drawerItemModel: DrawerItemModel(
              title: S.of(context).dashboard, image: Assets.imagesDashboard),
        ),
      ],
    );
  }
}
