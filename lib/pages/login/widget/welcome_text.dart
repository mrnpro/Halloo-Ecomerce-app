import 'package:flutter/material.dart';

class WelcomeText extends StatelessWidget {
  const WelcomeText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      "Welcome",
      style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
    );
  }
}
