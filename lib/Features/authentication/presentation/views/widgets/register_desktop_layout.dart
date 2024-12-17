import 'package:flutter/material.dart';
import 'package:source_safe_project/Features/authentication/presentation/views/widgets/title_and_fields_section_in_register.dart';
import 'package:source_safe_project/core/utils/app_images.dart';
import 'package:source_safe_project/core/utils/functions.dart';
import 'package:source_safe_project/core/widgets/custom_svg_picture.dart';

class RegisterDesktopLayout extends StatelessWidget {
  const RegisterDesktopLayout({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomSvgPicture(
              image: Assets.imagesSignUp, maxWidth: getMaxWidth(context)),
        ),
        SizedBox(
          width: 100,
        ),
        Expanded(child: TitleAndFieldsSectionInRegister()),
      ],
    );
  }
}
