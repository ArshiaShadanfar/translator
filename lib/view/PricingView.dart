import 'package:flutter/material.dart';

class PricingView extends StatelessWidget {
  const PricingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Pricing Screen',
        style: Theme.of(context).textTheme.displayMedium,
      ),
    );
  }
}