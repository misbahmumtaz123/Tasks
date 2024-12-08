class AccountSummary {
  final int carbonCreditsAvailable;
  final int carbonCreditsSold;
  final int carbonCreditsEarned;
  final int treePoolCount;

  AccountSummary({
    required this.carbonCreditsAvailable,
    required this.carbonCreditsSold,
    required this.carbonCreditsEarned,
    required this.treePoolCount,
  });
}

class GreenProject {
  final String title;
  final String description;
  final double completionPercentage;

  GreenProject({
    required this.title,
    required this.description,
    required this.completionPercentage,
  });
}
