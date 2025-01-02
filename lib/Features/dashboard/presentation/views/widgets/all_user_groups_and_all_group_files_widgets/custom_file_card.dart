import 'package:flutter/material.dart';
import 'package:source_safe_project/Features/dashboard/presentation/manager/file_check_box_cubit/file_check_box_cubit.dart';
import 'package:source_safe_project/core/utils/app_colors.dart';
import 'package:source_safe_project/core/utils/app_styles.dart';

class CustomFileCard extends StatelessWidget {
  const CustomFileCard({
    super.key,
    required this.fileId,
    required this.fileName,
    required this.isReserved,
  });
  final int fileId;
  final String? fileName;
  final bool? isReserved;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFFFAFAFA),
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  fileName ?? '',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                Text(
                  (isReserved ?? true) ? 'Reserved' : 'Available',
                  style: AppStyles.styleMedium14(context).copyWith(
                    color: (isReserved ?? true)
                        ? AppColors.red
                        : AppColors.successGren,
                  ),
                ),
              ],
            ),
            const SizedBox(width: 10),
            GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () {
                final newValue =
                    !(FileCheckBoxCubit.get(context).checkedUsers[fileId] ??
                        false);
                FileCheckBoxCubit.get(context)
                    .onChangedCheckBox(newValue, fileId);
              },
              child: Checkbox(
                value: FileCheckBoxCubit.get(context).checkedUsers[fileId] ??
                    false,
                onChanged: (bool? value) {
                  FileCheckBoxCubit.get(context)
                      .onChangedCheckBox(value ?? false, fileId);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
