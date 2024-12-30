import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:source_safe_project/Features/dashboard/data/models/all_user_groups_item_model.dart';
import 'package:source_safe_project/Features/dashboard/presentation/manager/get_user_groups_cubit/get_user_groups_cubit.dart';
import 'package:source_safe_project/Features/dashboard/presentation/views/widgets/test/all_user_groups_item.dart';
import 'package:source_safe_project/core/utils/app_images.dart';
import 'package:source_safe_project/core/utils/app_prefs.dart';
import 'package:source_safe_project/core/utils/service_locator.dart';

class AllUserGroupsItemsListView extends StatefulWidget {
  const AllUserGroupsItemsListView({super.key});

  @override
  State<AllUserGroupsItemsListView> createState() =>
      _AllUserGroupsItemsListViewState();
}

class _AllUserGroupsItemsListViewState
    extends State<AllUserGroupsItemsListView> {
  int selectedIndex = 0;
  final ScrollController _scrollController = ScrollController();
  AppPreferences appPreferences = getIt.get<AppPreferences>();

  Future<void> _initializeData() async {
    try {
      final userId = await appPreferences.getUserId();
      if (!mounted) return; // Check if the widget is still mounted
      if (userId != null) {
        GetUserGroupsCubit.get(context).getUserGroups(userId: userId);
      } else {
        print('Failed to retrieve userId');
      }
    } catch (e) {
      if (mounted) {
        print('Error: $e');
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _initializeData(); // Call the async initializer
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetUserGroupsCubit, GetUserGroupsState>(
      builder: (context, state) {
        return state is GetUserGroupsSuccess
            ? GestureDetector(
                onHorizontalDragUpdate: (details) {
                  _scrollController.jumpTo(
                    _scrollController.offset - details.delta.dx,
                  );
                },
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  controller: _scrollController,
                  child: Row(
                    children: state.groupModel.items.asMap().entries.map((e) {
                      int index = e.key;
                      var item = e.value;
                      return GestureDetector(
                        onTap: () {
                          updateIndex(index);
                        },
                        child: Row(
                          children: [
                            AllUserGroupsItem(
                              isSelected: selectedIndex == index,
                              itemModel: item,
                            ),
                            // Add space to the right of every element except the last one
                            if (index != state.groupModel.items.length - 1)
                              SizedBox(width: 8.0), // Adjust width as needed
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ),
              )
            : SizedBox();
      },
    );
  }

  void updateIndex(int index) {
    setState(() {
      selectedIndex = index;
    });
  }
}
