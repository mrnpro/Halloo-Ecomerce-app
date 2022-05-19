import 'package:flutter/material.dart';

import 'package:hallo_shop/pages/login/sign_up.dart';

import '../../../constant.dart';

class CustomButton extends StatelessWidget {
  CustomButton({
    required this.text,
    required this.onPressed,
    Key? key,
  }) : super(key: key);
  String text;
  final onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: TextButton.styleFrom(padding: EdgeInsets.zero),
        onPressed: onPressed,
        child: Container(
          height: 50,
          decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Colors.deepOrange,
                  Colors.orange,
                ],
              ),
              color: kprimary,
              borderRadius: BorderRadius.circular(10)),
          margin: const EdgeInsets.only(left: 20, right: 20),
          child: Center(
              child: Text(
            text,
            style: const TextStyle(color: Colors.white, fontSize: 20),
          )),
        ));
  }
}
