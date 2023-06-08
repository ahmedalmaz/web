import 'package:ashtar/utility/all_app_words.dart';
import 'package:get/get.dart';

import '../utility/app_setting.dart';
// import 'arabic_to_english_number.dart';

enum TextFieldvalidatorType {
  Email,
  Password,
  ConfirmPassword,
  PhoneNumber,
  NormalText,
  Code,
  Number,
  Name,
  Optional,
  FirstVisit,
  IdNumber,
  Required,
  HaveNotSenstiveWords
}

validation(
    {required TextFieldvalidatorType type,
    required String value,
    required String firstPAsswordForConfirm}) {
  if (type == TextFieldvalidatorType.PhoneNumber) {
    if (value.isEmpty) {
      return ValidationWords.mobile_required.tr;
    }
    return null;
  } else if (type == TextFieldvalidatorType.Email) {
    if (value.isEmpty) {
      return  '*required';
    } else if (value.isNotEmpty && !regExpEmail.hasMatch(value)) {
      return 'invalid email';
    } else {
      return null;
    }
  } else if (type == TextFieldvalidatorType.Password) {
    if (value.isEmpty) {
      return 'Required';
    } else if (value.length < 6) {
      return 'Password Atleast six digits';
    } else if (value.length > 30) {
      return 'Password must be less than 30 digits';
    } else
      return null;
  } else if (type == TextFieldvalidatorType.ConfirmPassword) {
    if (value.isEmpty) {
      return '*required';
    } else if (value != firstPAsswordForConfirm) {
      return 'dismatch';
    } else {
      return null;
    }
  } else if (type == TextFieldvalidatorType.Code) {
    if (value.isEmpty) {
      return '*required';
    }
  } else if (type == TextFieldvalidatorType.Optional) {
    return null;
  } else if (type == TextFieldvalidatorType.Number) {
    if (value.isEmpty) {
      return  '*required';
    }
    if (value.length != 10) {
      return 'ID must be 10 numbers';
    }
    if (!regExpNumber.hasMatch(value.trim().replaceAll('‎', ''))) {
      print(value.toString());
      return 'don’t enter special chars';
    }
  } else if (type == TextFieldvalidatorType.Name) {
    if (value.isEmpty) {
      return  '*required';
    }
    if (!regExpName.hasMatch(value.trim().replaceAll('‎', ''))) {
      print(value.toString());
      return 'Letters only';
    }
  } else if (type == TextFieldvalidatorType.FirstVisit) {
    if (value.isEmpty) {
      return  '*required';
    }
  } else if (type == TextFieldvalidatorType.IdNumber) {
    if (value.isEmpty) {
      return  '*required';
    } else if (value.length != 10) {
      return 'must be 10 numbers';
    } else if (type == TextFieldvalidatorType.HaveNotSenstiveWords) {
      if (value.isEmpty) {
        return 'Required';
      } else if (!regExpNumberAndLettersOnly
          .hasMatch(value.trim().replaceAll('‎', ''))) {
        return 'Numbers and letters only';
      }
    } else if (type == TextFieldvalidatorType.Required) {
      if (value.isEmpty) {
        return '*required';
      }
    } else {
      return null;
    }
  }
}
