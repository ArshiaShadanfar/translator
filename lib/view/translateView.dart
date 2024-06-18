import 'package:flutter/material.dart';

class TranslateView extends StatelessWidget {
  const TranslateView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Translate Screen',
        style: Theme.of(context).textTheme.displayMedium,
      ),
    );
  }
}