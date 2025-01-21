import 'package:flutter/material.dart';
import 'package:source_safe_project/generated/l10n.dart';

class AllUserGroupsHeader extends StatelessWidget {
  const AllUserGroupsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      S.of(context).allUserGroups,
      style: Theme.of(context).textTheme.displayLarge,
    );
  }
}
