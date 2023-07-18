import 'package:appwash/model/auth/signup_model.dart';
import 'package:appwash/utils/enums.dart';
import 'package:appwash/utils/logics/regex.dart';
import 'package:appwash/utils/widgets/customs/toast.dart';
import 'package:get/get.dart';

class AuthViewModel extends GetxController {
  // Store
  final _signupData =
      Rx<SignUpModel>(SignUpModel(firstName: '', lastName: '', email: ''));
  final _activeFields = false.obs;
  // Get from store
  String get firstName => _signupData.value.firstName;
  String get lastName => _signupData.value.lastName;
  String get email => _signupData.value.email;
  bool get activeFields => _activeFields.value;
  // Set in store
  void updateSignUpData({String? fname, String? lname, String? emailId}) {
    _activeFields.value = true;
    _signupData.value = SignUpModel(
        firstName: fname ?? firstName,
        lastName: lname ?? lastName,
        email: emailId ?? email);
  }

  void submit(context) {
    _activeFields.value = true;
    _activeFields.refresh();
    if (allValid) {
      // Get.offAllNamed(Routes.WELCOMEBACK);
      Get.back();

      ToastKit.showToast(context,
          message: "Submit successfully!",
          toastType: ToastType.SUCCESS,
          opacity: 0.3,
          toastPosition: ToastPosition.BOTTOM);
    }
  }

  ///---===---
  // Input status
  bool get allValid => (firstNameStatus() == ValidationStatus.GOOD_JOB &&
      lastNameStatus() == ValidationStatus.GOOD_JOB &&
      emailStatus() == ValidationStatus.GOOD_JOB);

  firstNameStatus({bool? msg}) {
    if (!_activeFields.value) {
      return msg == null ? ValidationStatus.NONE : null;
    } else if (_signupData.value.firstName == '') {
      return msg == null ? ValidationStatus.EMPTY : null;
    } else if (_signupData.value.firstName.length <= 2) {
      return msg == null ? ValidationStatus.OTHER : 'First name is not valid!';
    } else if (_signupData.value.firstName.length > 2) {
      return msg == null ? ValidationStatus.GOOD_JOB : "Good Job!";
    } else {
      return ValidationStatus.NONE;
    }
  }

  lastNameStatus({bool? msg}) {
    if (!_activeFields.value) {
      return msg == null ? ValidationStatus.NONE : null;
    } else if (_signupData.value.lastName == '') {
      return msg == null ? ValidationStatus.EMPTY : null;
    } else if (_signupData.value.lastName.length <= 2) {
      return msg == null ? ValidationStatus.OTHER : 'Last name is not valid!';
    } else if (_signupData.value.lastName.length > 2) {
      return msg == null ? ValidationStatus.GOOD_JOB : "Good Job!";
    } else {
      return ValidationStatus.NONE;
    }
  }

  emailStatus({bool? msg}) {
    if (!_activeFields.value) {
      return msg == null ? ValidationStatus.NONE : null;
    } else if (_signupData.value.email == '') {
      return msg == null ? ValidationStatus.EMPTY : null;
    } else if (!Validations.check(CheckValid(email: _signupData.value.email))) {
      return msg == null ? ValidationStatus.OTHER : 'Email is not valid!';
    } else if (_signupData.value.email.length > 2) {
      return msg == null ? ValidationStatus.GOOD_JOB : "Good Job!";
    } else {
      return ValidationStatus.NONE;
    }
  }
}
