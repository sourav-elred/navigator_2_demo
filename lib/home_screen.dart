import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final VoidCallback onSettings;
  final ValueChanged<String> onDetails;

  const HomeScreen(
      {super.key, required this.onSettings, required this.onDetails});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: onSettings,
              child: const Text('Go to Settings'),
            ),
            ElevatedButton(
              onPressed: () => onDetails('Item 1'),
              child: const Text('Go to Details with Item 1'),
            ),
            ElevatedButton(
              onPressed: () => onDetails('Item 2'),
              child: const Text('Go to Details with Item 2'),
            ),
          ],
        ),
      ),
    );
  }
}
