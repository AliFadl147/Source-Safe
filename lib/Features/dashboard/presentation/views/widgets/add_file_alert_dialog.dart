import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:source_safe_project/Features/dashboard/presentation/manager/get_user_groups_cubit/get_user_groups_cubit.dart';
import 'package:source_safe_project/Features/dashboard/presentation/manager/radio_and_validation_cubit/radio_and_validation_cubit.dart';
import 'package:source_safe_project/Features/dashboard/presentation/views/widgets/actions_add_file_alert_dialog_section.dart';
import 'package:source_safe_project/Features/dashboard/presentation/views/widgets/custom_radio_list_tile.dart';
import 'package:source_safe_project/core/utils/app_colors.dart';
import 'package:source_safe_project/core/utils/app_prefs.dart';
import 'package:source_safe_project/core/utils/service_locator.dart';

class Addfilealertdialog extends StatefulWidget {
  const Addfilealertdialog({
    super.key,
  });

  @override
  State<Addfilealertdialog> createState() => _AddfilealertdialogState();
}

class _AddfilealertdialogState extends State<Addfilealertdialog> {
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
    RadioAndValidationCubit.get(context).selectedGroup = null;
    _initializeData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetUserGroupsCubit, GetUserGroupsState>(
      builder: (context, state) {
        return BlocBuilder<RadioAndValidationCubit, RadioAndValidationState>(
          builder: (context, radioState) {
            return LayoutBuilder(
              builder: (_, constrains) => AlertDialog(
                backgroundColor: AppColors.white,
                scrollable: false,
                content: SizedBox(
                  width: constrains.maxWidth * .3,
                  height: constrains.maxHeight * .8,
                  child: CustomScrollView(
                    slivers: [
                      state is GetUserGroupsSuccess
                          ? SliverList.builder(
                              itemCount: state.groupModel.items.length,
                              itemBuilder: (context, index) => Column(
                                children: [
                                  CustomRadioListTile(
                                    groupName: state.groupModel.items[index]
                                            .groupName ??
                                        '',
                                    groupAdminName: state.groupModel
                                            .items[index].groupAdminName ??
                                        '',
                                    groupId:
                                        state.groupModel.items[index].groupId ??
                                            0,
                                  ),
                                  if (index !=
                                      state.groupModel.items.length - 1)
                                    Divider(color: Colors.grey.shade300),
                                ],
                              ),
                            )
                          : SliverToBoxAdapter(child: SizedBox()),
                    ],
                  ),
                ),
                actions: [
                  ActionsAddFileAlertDialogSection(),
                ],
                actionsPadding:
                    EdgeInsets.only(top: 10, bottom: 20, left: 20, right: 20),
              ),
            );
          },
        );
      },
    );
  }
}
