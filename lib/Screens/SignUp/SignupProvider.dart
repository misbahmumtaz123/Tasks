import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'SignUpViewModel.dart';
import 'SignupState.dart';

final signupViewModelProvider =
StateNotifierProvider<SignupViewModel, SignupState>((ref) {
  return SignupViewModel();
});
