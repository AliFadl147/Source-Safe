import 'package:flutter/material.dart';
import 'package:source_safe_project/Features/dashboard/presentation/manager/radio_and_validation_cubit/radio_and_validation_cubit.dart';

class CustomRadioListTile extends StatelessWidget {
  final String groupName;
  final String groupAdminName;
  final int groupId;

  const CustomRadioListTile({
    required this.groupName,
    super.key,
    required this.groupAdminName,
    required this.groupId,
  });

  @override
  Widget build(BuildContext context) {
    return RadioListTile<String>(
      title: Text(groupName, style: Theme.of(context).textTheme.headlineMedium),
      value: groupName,
      groupValue: RadioAndValidationCubit.get(context).selectedGroup,
      onChanged: (value) {
        RadioAndValidationCubit.get(context).onChangedRadio(value, groupId);
      },
      controlAffinity: ListTileControlAffinity.trailing,
      
    );
  }
}
