import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'SignupState.dart';


class SignupViewModel extends StateNotifier<SignupState> {
  SignupViewModel() : super(SignupState());

  bool validateAndSubmit(
      String firstName,
      String lastName,
      String email,
      String phone,
      String address,
      String gender,
      String password,
      String confirmPassword,
      ) {
    bool isValid = true;

    if (firstName.isEmpty) {
      state = state.copyWith(firstNameError: "First name is required");
      isValid = false;
    } else {
      state = state.copyWith(firstNameError: null);
    }

    if (lastName.isEmpty) {
      state = state.copyWith(lastNameError: "Last name is required");
      isValid = false;
    } else {
      state = state.copyWith(lastNameError: null);
    }

    if (email.isEmpty || !email.contains('@')) {
      state = state.copyWith(emailError: "Invalid email");
      isValid = false;
    } else {
      state = state.copyWith(emailError: null);
    }

    if (phone.isEmpty) {
      state = state.copyWith(phoneError: "Phone number is required");
      isValid = false;
    } else {
      state = state.copyWith(phoneError: null);
    }

    if (address.isEmpty) {
      state = state.copyWith(addressError: "Address is required");
      isValid = false;
    } else {
      state = state.copyWith(addressError: null);
    }

    if (password.isEmpty || password.length < 6) {
      state = state.copyWith(passwordError: "Password must be at least 6 characters");
      isValid = false;
    } else {
      state = state.copyWith(passwordError: null);
    }

    if (confirmPassword != password) {
      state = state.copyWith(confirmPasswordError: "Passwords do not match");
      isValid = false;
    } else {
      state = state.copyWith(confirmPasswordError: null);
    }

    return isValid;
  }

  Future<bool> signup() async {
    state = state.copyWith(isLoading: true);
    await Future.delayed(const Duration(seconds: 2)); // Simulate API call
    state = state.copyWith(isLoading: false);
    return true; // Simulate success
  }
}
