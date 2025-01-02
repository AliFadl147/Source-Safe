import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:source_safe_project/Features/authentication/data/models/text_field_model.dart';
import 'package:source_safe_project/Features/dashboard/presentation/manager/check_box_and_validation_cubit/check_box_and_validation_cubit.dart';
import 'package:source_safe_project/Features/dashboard/presentation/manager/get_all_users_cubit/get_all_users_cubit.dart';
import 'package:source_safe_project/Features/dashboard/presentation/views/widgets/actions_alert_dialog_section.dart';
import 'package:source_safe_project/Features/dashboard/presentation/views/widgets/custom_check_box_list_tile.dart';
import 'package:source_safe_project/core/utils/app_colors.dart';
import 'package:source_safe_project/core/utils/app_prefs.dart';
import 'package:source_safe_project/core/utils/functions.dart';
import 'package:source_safe_project/core/utils/service_locator.dart';
import 'package:source_safe_project/core/widgets/custom_text_field_widget.dart';
import 'package:source_safe_project/generated/l10n.dart';

class CustomAlertDialog extends StatefulWidget {
  const CustomAlertDialog({
    super.key,
  });

  @override
  State<CustomAlertDialog> createState() => _CustomAlertDialogState();
}

class _CustomAlertDialogState extends State<CustomAlertDialog> {
  late TextEditingController _searchController;
  bool isGroupNameValid = true;
  AppPreferences appPreferences = getIt.get<AppPreferences>();

  Future<void> _initializeData() async {
    try {
      final userId = await appPreferences.getUserId();
      if (!mounted) return; // Check if the widget is still mounted
      if (userId != null) {
        GetAllUsersCubit.get(context).getAllUsers(id: userId);
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
    _searchController = TextEditingController();
    CheckBoxAndValidationCubit.get(context).checkedUsers.clear();
    selectedindexes.clear();
    _initializeData(); // Call the async initializer
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllUsersCubit, GetAllUsersState>(
      builder: (context, state) {
        return BlocBuilder<CheckBoxAndValidationCubit,
            CheckBoxAndValidationState>(
          builder: (context, checkboxState) {
            return LayoutBuilder(
              builder: (_, constrains) => AlertDialog(
                backgroundColor: AppColors.white,
                scrollable: false,
                content: SizedBox(
                  width: constrains.maxWidth * .3,
                  height: constrains.maxHeight * .8,
                  child: CustomScrollView(
                    slivers: [
                      SliverToBoxAdapter(
                        child: CustomTextFieldWidget(
                          textFieldModel: TextFieldModel(
                            controller: _searchController,
                            label: S.of(context).search,
                            fillColor: AppColors.white,
                            onFieldSubmitted: (value) {},
                            prefixIcon: Icons.search,
                          ),
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: SizedBox(
                          height: 8,
                        ),
                      ),
                      state is GetAllUsersSuccess
                          ? SliverList.builder(
                              itemCount: state.usersModel.items.length,
                              itemBuilder: (context, index) => Column(
                                children: [
                                  CustomCheckBoxListTile(
                                    id: state.usersModel.items[index].id,
                                    name: state.usersModel.items[index].name,
                                    email: state.usersModel.items[index].email,
                                    onChanged: (bool? value) {
                                      CheckBoxAndValidationCubit.get(context)
                                          .onChangedCheckBox(value ?? false,
                                              state.usersModel.items[index].id);
                                    },
                                    checkedUsers:
                                        CheckBoxAndValidationCubit.get(context)
                                            .checkedUsers,
                                  ),
                                  if (index !=
                                      state.usersModel.items.length - 1)
                                    Divider(color: Colors.grey.shade300),
                                ],
                              ),
                            )
                          : SliverToBoxAdapter(child: SizedBox()),
                    ],
                  ),
                ),
                actions: [
                  ActionsAlertDialogSection(),
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

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
