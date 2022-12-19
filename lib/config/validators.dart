import 'package:flutter_riverpod/flutter_riverpod.dart';

final validatorsProvider = Provider<Validators>((ref) {
  return Validators();
});

class Validators {
  final emailRegex =
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";

  String? validateEmail(String? email) {
    if (email == null || email.isEmpty) {
      return "Email Field can't be empty";
    } else if (!RegExp(emailRegex).hasMatch(email)) {
      return "Please enter a valid email address";
    }
    return null;
  }

  String? validatePassword(String? password) {
    if (password == null || password.isEmpty) {
      return "Password field can't be empty";
    } else if (password.length < 6) {
      return "Password must contain atleast 6 characters";
    }
    return null;
  }

  String? validateMobile(String? phone) {
    if (phone == null || phone.isEmpty) {
      return "Password field can't be empty";
    } else if (phone.length < 10) {
      return "Password must contain atleast 10 digits";
    }
    return null;
  }

  String? validateConfirmPassword(String? confirmPassword, String password) {
    if (confirmPassword == null || confirmPassword.isEmpty) {
      return "Confirm Password field can't be empty";
    } else if (confirmPassword != password) {
      return "Confirm password filed can't be matched with password field";
    }
    return null;
  }

  String? validateTermsAccepted(value) {
    if (value == null || value == false) {
      return "Please agree to terms and conditions.";
    }
    return null;
  }

  String? validateGender(String? gender) {
    return validate(gender, "Please select a gender");
  }

  String? validateName(String? name) {
    return validate(name, "Full name field can't be empty");
  }

  String? validate(String? value, String errorMessage) {
    if (value == null || value.isEmpty) {
      return errorMessage;
    }
    return null;
  }
}