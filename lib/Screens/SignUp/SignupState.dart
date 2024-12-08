class SignupState {
  final bool isLoading;
  final String? firstNameError;
  final String? lastNameError;
  final String? emailError;
  final String? phoneError;
  final String? addressError;
  final String? passwordError;
  final String? confirmPasswordError;

  SignupState({
    this.isLoading = false,
    this.firstNameError,
    this.lastNameError,
    this.emailError,
    this.phoneError,
    this.addressError,
    this.passwordError,
    this.confirmPasswordError,
  });

  SignupState copyWith({
    bool? isLoading,
    String? firstNameError,
    String? lastNameError,
    String? emailError,
    String? phoneError,
    String? addressError,
    String? passwordError,
    String? confirmPasswordError,
  }) {
    return SignupState(
      isLoading: isLoading ?? this.isLoading,
      firstNameError: firstNameError,
      lastNameError: lastNameError,
      emailError: emailError,
      phoneError: phoneError,
      addressError: addressError,
      passwordError: passwordError,
      confirmPasswordError: confirmPasswordError,
    );
  }
}
