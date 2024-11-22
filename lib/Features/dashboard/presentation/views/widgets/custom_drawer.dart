import 'package:flutter/material.dart';
import 'package:source_safe_project/Features/dashboard/data/models/drawer_item_model.dart';
import 'package:source_safe_project/Features/dashboard/data/models/user_info_model.dart';
import 'package:source_safe_project/Features/dashboard/presentation/views/widgets/active_and_inactive_item.dart';
import 'package:source_safe_project/Features/dashboard/presentation/views/widgets/drawer_items_list_view.dart';
import 'package:source_safe_project/Features/dashboard/presentation/views/widgets/switch_list_tile_list_view.dart';
import 'package:source_safe_project/Features/dashboard/presentation/views/widgets/user_info_list_tile.dart';
import 'package:source_safe_project/core/utils/app_images.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * .7,
      color: const Color.fromRGBO(255, 255, 255, 1),
      child: const CustomScrollView(
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
                  title: 'Dashboard', image: Assets.imagesDashboard),
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
                      title: 'Logout account', image: Assets.imagesLogout),
                ),
                SizedBox(
                  height: 48,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}