import 'package:flutter/material.dart';
import 'package:source_safe_project/Features/dashboard/presentation/views/widgets/test/latest_transction_list_view.dart';
import 'package:source_safe_project/core/utils/app_styles.dart';

class LatestTransction extends StatelessWidget {
  const LatestTransction({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Latest Transaction',
          style: AppStyles.styleMedium16(context),
        ),
        const SizedBox(
          height: 16,
        ),
        const LatestTransctionListView()
      ],
    );
  }
}
