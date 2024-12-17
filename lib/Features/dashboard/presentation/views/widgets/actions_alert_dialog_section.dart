import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:source_safe_project/Features/authentication/data/models/text_field_model.dart';
import 'package:source_safe_project/Features/dashboard/presentation/manager/add_group_cubit/add_group_cubit.dart';
import 'package:source_safe_project/Features/dashboard/presentation/manager/create_group_cubit/create_group_cubit.dart';
import 'package:source_safe_project/core/utils/app_colors.dart';
import 'package:source_safe_project/core/utils/functions.dart';
import 'package:source_safe_project/core/widgets/custom_button.dart';
import 'package:source_safe_project/core/widgets/custom_text_field_widget.dart';
import 'package:source_safe_project/generated/l10n.dart';

class ActionsAlertDialogSection extends StatefulWidget {
  const ActionsAlertDialogSection({
    super.key,
  });

  @override
  State<ActionsAlertDialogSection> createState() =>
      _ActionsAlertDialogSectionState();
}

class _ActionsAlertDialogSectionState extends State<ActionsAlertDialogSection> {
  late TextEditingController _groupNameController;
  bool isGroupNameValid = true;

  @override
  void initState() {
    _groupNameController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CreateGroupCubit, CreateGroupState>(
      listener: (context, state) {
        if (state is GroupNameIsValid) {
          isGroupNameValid = true;
        } else if (state is GroupNameIsInValid) {
          isGroupNameValid = false;
        }
      },
      builder: (context, state) {
        return Column(
          children: [
            CustomTextFieldWidget(
              textFieldModel: TextFieldModel(
                controller: _groupNameController,
                label: S.of(context).groupName,
                fillColor: AppColors.white,
                error: (isGroupNameValid) ? null : S.of(context).groupNameError,
                onChanged: (value) =>
                    CreateGroupCubit.get(context).setGroupName(value),
                prefixIcon: Icons.search,
              ),
            ),
            SizedBox(
              height: 16,
            ),
            SizedBox(
              width: double.infinity,
              child: CustomButton(
                foregroundColor: AppColors.white,
                text: S.of(context).createAGroup,
                onPressed: (_groupNameController.text.length >= 3 &&
                        selectedindexes.isNotEmpty)
                    ? () {
                        AddGroupCubit.get(context).addGroup(context);
                      }
                    : null,
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    _groupNameController.dispose();
    super.dispose();
  }
}
