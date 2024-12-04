import 'package:flutter/material.dart';
import 'package:source_safe_project/Features/dashboard/data/models/drawer_item_model.dart';
import 'package:source_safe_project/Features/dashboard/data/models/user_info_model.dart';
import 'package:source_safe_project/Features/dashboard/presentation/views/widgets/active_and_inactive_item.dart';
import 'package:source_safe_project/Features/dashboard/presentation/views/widgets/switch_list_tile_list_view.dart';
import 'package:source_safe_project/Features/dashboard/presentation/views/widgets/user_info_list_tile.dart';
import 'package:source_safe_project/core/utils/app_images.dart';
import 'package:source_safe_project/core/utils/app_strings.dart';
import 'package:easy_localization/easy_localization.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width * .7,
      child: Card(
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.zero, // Sharp borders
        ),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: UserInfoListTile(
                userInfoModel: UserInfoModel(
                    image: Assets.imagesAvatar3,
                    title: 'Lekan Okeowo',
                    subTitle: 'demo@gmail.com'),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 8,
              ),
            ),
            SliverToBoxAdapter(
              child: ActiveDrawerItem(
                drawerItemModel: DrawerItemModel(
                    title: AppStrings.dashboard.tr(),
                    image: Assets.imagesDashboard),
              ),
            ),
            SwitchListTileListView(),
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                children: [
                  Expanded(
                      child: SizedBox(
                    height: 20,
                  )),
                  InActiveDrawerItem(
                    drawerItemModel: DrawerItemModel(
                        title: AppStrings.logoutAccount.tr(), image: Assets.imagesLogout),
                  ),
                  SizedBox(
                    height: 48,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
