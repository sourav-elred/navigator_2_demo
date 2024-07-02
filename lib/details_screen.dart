import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  final String item;

  const DetailsScreen({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details Screen'),
      ),
      body: Center(
        child: Text('Details for $item'),
      ),
    );
  }
}
