import 'package:flutter/material.dart';

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
