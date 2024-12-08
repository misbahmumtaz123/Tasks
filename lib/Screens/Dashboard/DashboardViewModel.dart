import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'DashboardModel.dart';

class HomeViewModel extends StateNotifier<AccountSummary> {
  HomeViewModel()
      : super(AccountSummary(
    carbonCreditsAvailable: 20000,
    carbonCreditsSold: 10000,
    carbonCreditsEarned: 20000,
    treePoolCount: 10000,
  ));

  // Example method to update the account summary
  void updateAccountSummary(AccountSummary summary) {
    state = summary;
  }
}

final homeViewModelProvider =
StateNotifierProvider<HomeViewModel, AccountSummary>(
      (ref) => HomeViewModel(),
);
