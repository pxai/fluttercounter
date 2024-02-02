import 'package:flutter/material.dart';

class MyText extends StatelessWidget {
  const MyText({super.key, required this.text});

  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(this.text, style: Theme.of(context).textTheme.headlineMedium);
  }
}
