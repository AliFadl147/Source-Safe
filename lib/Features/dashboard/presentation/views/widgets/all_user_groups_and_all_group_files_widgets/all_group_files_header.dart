import 'package:flutter/material.dart';
import 'package:source_safe_project/core/utils/app_styles.dart';

class AllGroupFilesHeader extends StatelessWidget {
  const AllGroupFilesHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'All Group Files',
          style: AppStyles.styleSemiBold20(context),
        ),
        SizedBox(
            height: 16,
          ),
      ],
    );
  }
}
