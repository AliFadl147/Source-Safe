import 'package:flutter/material.dart';
import 'package:source_safe_project/Features/dashboard/presentation/manager/create_group_cubit/create_group_cubit.dart';
import 'package:source_safe_project/core/utils/app_colors.dart';

class CustomCheckBoxListTile extends StatelessWidget {
  const CustomCheckBoxListTile({
    super.key,
    required this.name,
    required this.email,
    required this.checkedUsers,
    required this.id,
  });

  final int id;
  final String? name;
  final String? email;
  final Map<int, bool> checkedUsers;

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title:
          Text(name ?? '', style: Theme.of(context).textTheme.headlineMedium),
      value: checkedUsers.containsKey(id),
      onChanged: (bool? value) {
        CreateGroupCubit.get(context).onChangedCheckBox(value ?? false, id);
      },
      subtitle: Text(email ?? '', style: Theme.of(context).textTheme.bodySmall),
      activeColor: AppColors.kPrimaryColor,
      side: BorderSide(
          color: AppColors.darkShadeOfCyanBlue,
          width: 2), // Change the color of the square.
    );
  }
}
