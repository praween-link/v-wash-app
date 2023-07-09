import 'package:flutter/services.dart';

RegExp firstNameRegX = RegExp(r'^[a-zA-Z]+$');
RegExp lastNameRegX = RegExp(r'^[a-z A-Z]+$');
RegExp emailRegX = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
RegExp phoneRegX = RegExp(r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$');

/// Input Validations
class Validations {
  static check(CheckValid checkValid) {
    if ((checkValid.firstName != null &&
        !firstName(checkValid.firstName ?? ''))) {
      return false;
    }

    if ((checkValid.lastName != null && !lastName(checkValid.lastName ?? ''))) {
      return false;
    }

    if ((checkValid.email != null && !email(checkValid.email ?? ''))) {
      return false;
    }

    if ((checkValid.phone != null && !phone(checkValid.phone ?? ''))) {
      return false;
    }

    return true;
  }

  static bool firstName(String value) => firstNameRegX.hasMatch(value);
  static bool lastName(String value) => lastNameRegX.hasMatch(value);
  static bool email(String value) => emailRegX.hasMatch(value);
  static bool phone(String value) => phoneRegX.hasMatch(value);
}

class CheckValid {
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  CheckValid({this.firstName, this.lastName, this.email, this.phone});
}

/// Input Formates
class InputFormates {
  static TextInputFormatter emojiDeny = FilteringTextInputFormatter.deny(RegExp(
      r'(\u00a9|\u00ae|[\u2000-\u3300]|\ud83c[\ud000-\udfff]|\ud83d[\ud000-\udfff]|\ud83e[\ud000-\udfff])'));
  static TextInputFormatter spaceDeny =
      FilteringTextInputFormatter.deny(RegExp(r'\s'));
  static TextInputFormatter onlyLetterSpace =
      FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z+|\s]'));
  static TextInputFormatter onlyNumber =
      FilteringTextInputFormatter.allow(RegExp(r'[0-9]'));
  static TextInputFormatter onlyAmount =
      FilteringTextInputFormatter.allow(RegExp(r'[0-9]+|.'));
}

/// Input Max and Min Length
class InputLength {
  static int firstNameMax = 50;
  static int firstNameMin = 2;
  static int lastNameMax = 50;
  static int lastNameMin = 0;
  static int emailMax = 75;
  static int emailMin = 50;
  static int phoneMax = 15;
  static int phoneMin = 8;
}
