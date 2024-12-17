import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:source_safe_project/Features/authentication/data/models/text_field_model.dart';
import 'package:source_safe_project/Features/authentication/presentation/manager/auth_validation_cubit/auth_validation_cubit.dart';
import 'package:source_safe_project/core/widgets/custom_text_field_widget.dart';
import 'package:source_safe_project/generated/l10n.dart';

class FirstnameAndLastnameFieldsSection extends StatefulWidget {
  const FirstnameAndLastnameFieldsSection({super.key});

  @override
  State<FirstnameAndLastnameFieldsSection> createState() =>
      _FirstnameAndLastnameFieldsSectionState();
}

class _FirstnameAndLastnameFieldsSectionState
    extends State<FirstnameAndLastnameFieldsSection> {
  late TextEditingController _firstNameController;

  late TextEditingController _lastNameController;

  bool isFirstNameValid = true;
  bool isLastNameValid = true;

  @override
  void initState() {
    _firstNameController = TextEditingController();
    _lastNameController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthValidationCubit, AuthValidationState>(
      listener: (BuildContext context, AuthValidationState state) {
        if (state is FirstNameIsValid) {
          isFirstNameValid = true;
        } else if (state is FirstNameIsInValid) {
          isFirstNameValid = false;
        } else if (state is LastNameIsValid) {
          isLastNameValid = true;
        } else if (state is LastNameIsInValid) {
          isLastNameValid = false;
        }
      },
      builder: (context, state) {
        return Column(
          children: [
            CustomTextFieldWidget(
              textFieldModel: TextFieldModel(
                controller: _firstNameController,
                label: S.of(context).firstName,
                onChanged: (value) =>
                    AuthValidationCubit.get(context).setFirstName(value),
                error: (isFirstNameValid) ? null : S.of(context).firstNameError,
                prefixIcon: Icons.first_page_rounded,
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 33.0),
            CustomTextFieldWidget(
              textFieldModel: TextFieldModel(
                controller: _lastNameController,
                label: S.of(context).lastName,
                onChanged: (value) =>
                    AuthValidationCubit.get(context).setLastName(value),
                error: (isLastNameValid) ? null : S.of(context).lastNameError,
                prefixIcon: Icons.last_page_rounded,
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    super.dispose();
  }
}
