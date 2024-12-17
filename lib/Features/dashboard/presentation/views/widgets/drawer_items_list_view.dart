// import 'package:flutter/widgets.dart';
// import 'package:source_safe_project/Features/dashboard/data/models/drawer_item_model.dart';
// import 'package:source_safe_project/Features/dashboard/presentation/views/widgets/drawer_item.dart';
// import 'package:source_safe_project/core/utils/app_images.dart';

// class DrawerItemsListView extends StatefulWidget {
//   const DrawerItemsListView({
//     super.key,
//   });

//   @override
//   State<DrawerItemsListView> createState() => _DrawerItemsListViewState();
// }

// class _DrawerItemsListViewState extends State<DrawerItemsListView> {
//   int activeIndex = 0;

//   final List<DrawerItemModel> items = [
//     const DrawerItemModel(title: 'Dashboard', image: Assets.imagesDashboard),
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return SliverList.builder(
//       itemCount: items.length,
//       itemBuilder: (context, index) {
//         return GestureDetector(
//           onTap: () {
//             if (activeIndex != index) {
//               setState(() {
//                 activeIndex = index;
//               });
//             }
//           },
//           child: Padding(
//             padding: const EdgeInsets.only(top: 20),
//             child: DrawerItem(
//               drawerItemModel: items[index],
//               isActive: activeIndex == index,
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
