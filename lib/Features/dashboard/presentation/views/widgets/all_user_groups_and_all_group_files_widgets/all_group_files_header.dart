import 'package:flutter/material.dart';
import 'package:source_safe_project/generated/l10n.dart';

class AllGroupFilesHeader extends StatelessWidget {
  const AllGroupFilesHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          S.of(context).allGroupFiles,
          style: Theme.of(context).textTheme.displayLarge,
        ),
        SizedBox(
            height: 16,
          ),
      ],
    );
  }
}
