import 'package:flutter/material.dart';
import 'package:source_safe_project/Features/authentication/presentation/views/widgets/login_fields_and_buttons.dart';
import 'package:source_safe_project/core/utils/app_images.dart';
import 'package:source_safe_project/core/utils/functions.dart';
import 'package:source_safe_project/core/widgets/custom_svg_picture.dart';

class PictureAndFieldsSection extends StatelessWidget {
  const PictureAndFieldsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomSvgPicture(
              image: Assets.imagesLogin, maxWidth: getMaxWidth(context)),
          const LoginFieldsAndButtons(),
        ],
      ),
    );
  }
}
