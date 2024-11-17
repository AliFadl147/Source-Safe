import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:source_safe_project/Features/authentication/data/models/text_field_model.dart';
import 'package:source_safe_project/Features/authentication/presentation/manager/auth_validation_cubit/auth_validation_cubit.dart';
import 'package:source_safe_project/core/utils/app_images.dart';
import 'package:source_safe_project/core/utils/app_strings.dart';
import 'package:source_safe_project/core/widgets/custom_text_field_widget.dart';

class AddressAndPhonenumberFieldsSection extends StatefulWidget {
  const AddressAndPhonenumberFieldsSection({super.key});

  @override
  State<AddressAndPhonenumberFieldsSection> createState() =>
      _AddressAndPhonenumberFieldsSectionState();
}

class _AddressAndPhonenumberFieldsSectionState
    extends State<AddressAndPhonenumberFieldsSection> {
  late TextEditingController _addressController;

  late TextEditingController _phoneNumberController;

  bool isAddressValid = true;
  bool isPhoneNumberValid = true;

  @override
  void initState() {
    _addressController = TextEditingController();
    _phoneNumberController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthValidationCubit, AuthValidationState>(
      listener: (BuildContext context, AuthValidationState state) {
        if (state is AddressIsValid) {
          isAddressValid = true;
        } else if (state is AddressIsInValid) {
          isAddressValid = false;
        } else if (state is PhoneNumberIsValid) {
          isPhoneNumberValid = true;
        } else if (state is PhoneNumberIsInValid) {
          isPhoneNumberValid = false;
        }
      },
      builder: (context, state) {
        return Column(
          children: [
            CustomTextFieldWidget(
              textFieldModel: TextFieldModel(
                controller: _addressController,
                label: AppStrings.address.tr(),
                onChanged: (value) =>
                    AuthValidationCubit.get(context).setAddress(value),
                error: (isAddressValid) ? null : AppStrings.addressError.tr(),
                prefixIcon: Assets.imagesAddress,
              ),
            ),
            SizedBox(
                height: MediaQuery.of(context).size.height / 33.0),
            CustomTextFieldWidget(
              textFieldModel: TextFieldModel(
                controller: _phoneNumberController,
                keyboardType: TextInputType.phone,
                label: AppStrings.phoneNumber.tr(),
                onChanged: (value) =>
                    AuthValidationCubit.get(context).setPhoneNumber(value),
                error:
                    (isPhoneNumberValid) ? null : AppStrings.phoneNumberError.tr(),
                prefixIcon: Assets.imagesPhone,
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    _addressController.dispose();
    _phoneNumberController.dispose();
    super.dispose();
  }
}
