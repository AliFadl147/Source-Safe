import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:source_safe_project/core/utils/app_styles.dart';

class AllUserGroupsHeader extends StatelessWidget {
  const AllUserGroupsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'All User Groups',
      style: AppStyles.styleSemiBold20(context),
    );
  }
}
