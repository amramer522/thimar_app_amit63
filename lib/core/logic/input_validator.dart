import 'package:easy_localization/easy_localization.dart';

class InputValidator {
  static final _phoneNumberRegEx = RegExp(r"01[0-2]\d{1,8}");
  static final _passwordRegEx = RegExp(r"(?=(.*[a-zA-Z0-9]){1,})(?=(.*[!@#$%^&*()\-__+.]){1,}).{8,}");

  static String? phone(String? value) {
    if (value!.trim().isEmpty) {
      return "phoneMustBeNotEmpty".tr();
    } else if (!_phoneNumberRegEx.hasMatch(value)) {
      return "invalidPhoneNumber".tr();
    }

    return null;
  }

  static String? password(String? value) {
    if (value!.trim().isEmpty) {
      return "passwordMustBeNotEmpty".tr();
    }
    // else if (!_passwordRegEx.hasMatch(value)) {
    //   return "weakPassword".tr();
    // }

    return null;
  }

  static String? normalInput(String title, String? value, {int length = 3}) {
    if (value!.trim().isEmpty) {
      return "$title Must be Not Empty";
    } else if (value.length < length) {
      return "$title must be at least $length Characters";
    }

    return null;
  }
}
