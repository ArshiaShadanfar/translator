import 'package:flutter/material.dart';

class AboutView extends StatelessWidget {
  const AboutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'About Screen',
        style: Theme.of(context).textTheme.displayMedium,
      ),
    );
  }
}