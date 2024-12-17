import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:source_safe_project/Features/authentication/data/models/text_field_model.dart';
import 'package:source_safe_project/Features/dashboard/presentation/manager/create_group_cubit/create_group_cubit.dart';
import 'package:source_safe_project/Features/dashboard/presentation/manager/get_all_users_cubit/get_all_users_cubit.dart';
import 'package:source_safe_project/Features/dashboard/presentation/views/widgets/actions_alert_dialog_section.dart';
import 'package:source_safe_project/Features/dashboard/presentation/views/widgets/custom_check_box_list_tile.dart';
import 'package:source_safe_project/core/utils/app_colors.dart';
import 'package:source_safe_project/core/utils/functions.dart';
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

  @override
  void initState() {
    _searchController = TextEditingController();
    CreateGroupCubit.get(context).checkedUsers.clear();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateGroupCubit, CreateGroupState>(
      builder: (context, stateG) {
        return BlocBuilder<GetAllUsersCubit, GetAllUsersState>(
          builder: (context, state) {
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
                              itemBuilder: (context, index) =>
                                  CustomCheckBoxListTile(
                                id: state.usersModel.items[index].id,
                                name: state.usersModel.items[index].name,
                                email: state.usersModel.items[index].email,
                                checkedUsers:
                                    CreateGroupCubit.get(context).checkedUsers,
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
