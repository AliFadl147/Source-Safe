import 'package:email_validator/email_validator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:source_safe_project/Features/authentication/presentation/freezed/freezed_data_classes.dart';
import 'package:source_safe_project/core/utils/functions.dart';
part 'auth_validation_state.dart';

class AuthValidationCubit extends Cubit<AuthValidationState> {
  AuthValidationCubit() : super(AuthValidationInitial());

  static AuthValidationCubit get(context) => BlocProvider.of(context);

  var loginObject = LoginObject("", "");

  var registerObject = RegisterObject("", "", "", "", "", "");

  setLoginPassword(String password) {
    if (_isPasswordValid(password)) {
      loginObject = loginObject.copyWith(password: password);
    } else {
      loginObject = loginObject.copyWith(password: "");
    }
    _areAllInputsLoginValid();
  }

  setLoginEmail(String email) {
    if (_isEmailValid(email)) {
      loginObject = loginObject.copyWith(email: email);
    } else {
      loginObject = loginObject.copyWith(email: "");
    }
    _areAllInputsLoginValid();
  }

  setFirstName(String firstName) {
    if (_isFirstNameValid(firstName)) {
      //  update register view object
      registerObject = registerObject.copyWith(firstName: firstName);
    } else {
      // reset username value in register view object
      registerObject = registerObject.copyWith(firstName: "");
    }
    _areAllInputsRegisterValid();
  }

  setLastName(String lastName) {
    if (_isLastNameValid(lastName)) {
      //  update register view object
      registerObject = registerObject.copyWith(lastName: lastName);
    } else {
      // reset lastName value in register view object
      registerObject = registerObject.copyWith(lastName: "");
    }
    _areAllInputsRegisterValid();
  }

  setRegisterPassword(String password) {
    if (_isPasswordValid(password)) {
      registerObject = registerObject.copyWith(password: password);
    } else {
      registerObject = registerObject.copyWith(password: "");
    }
    _areAllInputsRegisterValid();
  }

  setRegisterEmail(String email) {
    if (_isEmailValid(email)) {
      registerObject = registerObject.copyWith(email: email);
    } else {
      registerObject = registerObject.copyWith(email: "");
    }
    _areAllInputsRegisterValid();
  }

  setAddress(String address) {
    if (_isAddressValid(address)) {
      //  update register view object
      registerObject = registerObject.copyWith(address: address);
    } else {
      // reset address value in register view object
      registerObject = registerObject.copyWith(address: "");
    }
    _areAllInputsRegisterValid();
  }

  setPhoneNumber(String phoneNumber) {
    if (_isPhoneNumberValid(phoneNumber)) {
      //  update register view object
      registerObject = registerObject.copyWith(phoneNumber: phoneNumber);
    } else {
      // reset phoneNumber value in register view object
      registerObject = registerObject.copyWith(phoneNumber: "");
    }
    _areAllInputsRegisterValid();
  }

  bool _isFirstNameValid(String firstName) {
    if (firstName.length >= 3) {
      emit(FirstNameIsValid());
      return true;
    } else {
      emit(FirstNameIsInValid());
      return false;
    }
  }

  bool _isLastNameValid(String lastName) {
    if (lastName.length >= 3) {
      emit(LastNameIsValid());
      return true;
    } else {
      emit(LastNameIsInValid());
      return false;
    }
  }

  bool _isPasswordValid(String password) {
    if (password.isNotEmpty &&
        password.length >= 8 &&
        isDigitPasswordValid(password) &&
        isSymbolPasswordValid(password) &&
        isUpperCasePasswordValid(password) &&
        isLowerCasePasswordValid(password)) {
      emit(PasswordIsValid());
      return true;
    } else {
      emit(PasswordIsInValid());
      return false;
    }
  }

  bool _isEmailValid(String email) {
    if (email.isNotEmpty && EmailValidator.validate(email)) {
      emit(EmailIsValid());
      return true;
    } else {
      emit(EmailIsInValid());
      return false;
    }
  }

  bool _isPhoneNumberValid(String phoneNumber) {
    if (phoneNumber.length >= 10 && phoneNumber.isNotEmpty) {
      emit(PhoneNumberIsValid());
      return true;
    } else {
      emit(PhoneNumberIsInValid());
      return false;
    }
  }

  bool _isAddressValid(String address) {
    if (address.length >= 5 && address.isNotEmpty) {
      emit(AddressIsValid());
      return true;
    } else {
      emit(AddressIsInValid());
      return false;
    }
  }

  void _areAllInputsLoginValid() {
    if (loginObject.email.isNotEmpty && loginObject.password.isNotEmpty) {
      emit(AllDataLoginIsValid());
    }
  }

  void _areAllInputsRegisterValid() {
    if (registerObject.lastName.isNotEmpty &&
        registerObject.firstName.isNotEmpty &&
        registerObject.email.isNotEmpty &&
        registerObject.password.isNotEmpty &&
        registerObject.phoneNumber.isNotEmpty &&
        registerObject.address.isNotEmpty) {
      emit(AllDataRegisterIsValid());
    }
  }

  clearLoginObject() {
    loginObject = loginObject.copyWith(email: "");
    loginObject = loginObject.copyWith(password: "");
    emit(AllDataLoginIsInValid());
  }

  clearRegisterObject() {
    registerObject = registerObject.copyWith(firstName: "");
    registerObject = registerObject.copyWith(lastName: "");
    loginObject = loginObject.copyWith(email: "");
    loginObject = loginObject.copyWith(password: "");
    registerObject = registerObject.copyWith(address: "");
    registerObject = registerObject.copyWith(phoneNumber: "");
    emit(AllDataRegisterIsInValid());
  }
}
