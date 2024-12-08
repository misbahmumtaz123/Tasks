import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../Services/apiServices.dart';

final loginViewModelProvider = StateNotifierProvider<LoginViewModel, AsyncValue<void>>(
      (ref) => LoginViewModel(ref.read(apiServiceProvider)),
);

class LoginViewModel extends StateNotifier<AsyncValue<void>> {
  final ApiService apiService;

  LoginViewModel(this.apiService) : super(const AsyncValue.data(null));

  Future<void> login(String email) async {
    state = const AsyncValue.loading();
    try {
      final users = await apiService.fetchUser(email);
      if (users.isNotEmpty) {
        // Navigate to Dashboard
      } else {
        state = AsyncValue.error('User not found', StackTrace.current);
      }
    } catch (e) {
      state = AsyncValue.error(e.toString(), StackTrace.current);
    }
  }
}
