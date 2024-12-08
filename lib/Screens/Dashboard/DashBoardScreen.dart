import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'DashboardViewModel.dart';

class HomeScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final accountSummary = ref.watch(homeViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: [Icon(Icons.notifications)],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hi, Zohiab Hassan',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text('Verified', style: TextStyle(color: Colors.green)),
            SizedBox(height: 16),
            Card(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Account Summary'),
                    SizedBox(height: 8),
                    Text('Carbon Credits Available: ${accountSummary.carbonCreditsAvailable}'),
                    Text('Carbon Credits Sold: ${accountSummary.carbonCreditsSold}'),
                    Text('Carbon Credits Earned: ${accountSummary.carbonCreditsEarned}'),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        Column(
                          children: [
                            Text('My Tree Pool'),
                            Text('${accountSummary.treePoolCount} Trees'),
                          ],
                        ),
                        Spacer(),
                        ElevatedButton(
                          onPressed: () {},
                          child: Text('Add Green Project'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),
            Text('Recent Green Projects'),
            Card(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Threefold innovation: economic empowerment, reducing carbon emissions, and raising awareness.',
                      style: TextStyle(fontSize: 14),
                    ),
                    SizedBox(height: 16),
                    LinearProgressIndicator(value: 0.5),
                    Text('50% Completion'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.hail), label: 'Projects'),
          BottomNavigationBarItem(icon: Icon(Icons.account_balance_wallet), label: 'Wallet'),
          BottomNavigationBarItem(icon: Icon(Icons.track_changes), label: 'Target'),
        ],
      ),
    );
  }
}
