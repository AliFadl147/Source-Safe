import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:source_safe_project/Features/authentication/presentation/views/widgets/email_and_password_fields_section.dart';
import 'package:source_safe_project/Features/authentication/presentation/views/widgets/login_fields_and_buttons.dart';
import 'package:source_safe_project/Features/authentication/presentation/views/widgets/title_section.dart';
import 'package:source_safe_project/core/utils/app_images.dart';
import 'package:source_safe_project/core/utils/app_strings.dart';
import 'package:source_safe_project/core/utils/functions.dart';
import 'package:source_safe_project/core/widgets/custom_svg_picture.dart';

class LoginDesktopLayout extends StatelessWidget {
  const LoginDesktopLayout({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomSvgPicture(
              image: Assets.imagesLogin, maxWidth: getMaxWidth(context)),
        ),
        SizedBox(
          width: 100,
        ),
        Expanded(
            child: SingleChildScrollView(
          child: Column(
            children: [
              TitleSection(
                text: AppStrings.accessAndReserveYourTeamsFiles.tr(),
              ),
              const LoginFieldsAndButtons(),
            ],
          ),
        )),
      ],
    );
  }
}
