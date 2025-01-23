import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:source_safe_project/Features/dashboard/presentation/manager/file_check_box_cubit/file_check_box_cubit.dart';
import 'package:source_safe_project/core/utils/app_colors.dart';
import 'package:source_safe_project/core/utils/app_images.dart';
import 'package:source_safe_project/core/utils/app_styles.dart';
import 'package:source_safe_project/generated/l10n.dart';

class CustomFileCard extends StatelessWidget {
  const CustomFileCard({
    super.key,
    required this.fileId,
    required this.fileName,
    required this.isReserved,
    required this.filePath,
  });
  final int fileId;
  final String? fileName;
  final String filePath;
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
            Center(
              child: SvgPicture.asset(
                Assets.imagesFolder,
                colorFilter: ColorFilter.mode(
                    AppColors.kPrimaryColor, BlendMode.srcIn),
              ),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    fileName ?? '',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    (isReserved ?? true) ? S.of(context).reserved : S.of(context).available,
                    style: AppStyles.styleMedium14(context).copyWith(
                      color: (isReserved ?? true)
                          ? AppColors.red
                          : AppColors.successGren,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(width: 16),
            (isReserved ?? true)
                ? SvgPicture.asset(
                    Assets.imagesLock,
                    colorFilter: ColorFilter.mode(
                        AppColors.kPrimaryColor, BlendMode.srcIn),
                  )
                : GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () {
                      final newValue = !(FileCheckBoxCubit.get(context)
                              .checkedFiles[fileId] ??
                          false);
                      FileCheckBoxCubit.get(context)
                          .onChangedCheckBox(newValue, fileId, fileName ?? '');
                    },
                    child: Checkbox(
                      value:
                          FileCheckBoxCubit.get(context).checkedFiles[fileId] ??
                              false,
                      onChanged: (bool? value) {
                        FileCheckBoxCubit.get(context).onChangedCheckBox(
                            value ?? false, fileId, fileName ?? '');
                      },
                      side: BorderSide(
                          color: AppColors.darkShadeOfCyanBlue, width: 2),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
