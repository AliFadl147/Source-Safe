import 'package:flutter/material.dart';
import 'package:source_safe_project/core/utils/app_colors.dart';

class CustomCheckBoxListTile extends StatelessWidget {
  const CustomCheckBoxListTile({
    super.key,
    required this.name,
    required this.email,
    required this.checkedUsers,
    required this.id,
    required this.onChanged,
    this.style,
  });

  final int id;
  final String? name;
  final String? email;
  final Map<int, bool> checkedUsers;
  final ValueChanged<bool?>? onChanged;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: FittedBox(
          fit: BoxFit.scaleDown,
          alignment: AlignmentDirectional.centerStart,
          child: Text(name ?? '',
              style: Theme.of(context).textTheme.headlineMedium)),
      value: checkedUsers.containsKey(id),
      onChanged: onChanged,
      subtitle: FittedBox(
          fit: BoxFit.scaleDown,
          alignment: AlignmentDirectional.centerStart,
          child:
              Text(email ?? '', style: style ?? Theme.of(context).textTheme.bodySmall)),
      activeColor: AppColors.kPrimaryColor,
      side: BorderSide(
          color: AppColors.darkShadeOfCyanBlue,
          width: 2), // Change the color of the square.
    );
  }
}
