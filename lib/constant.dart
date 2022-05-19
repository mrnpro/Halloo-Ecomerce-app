import 'package:flutter/material.dart';

const kslightGray = Color.fromARGB(255, 235, 235, 235);

const kprimary = Color.fromRGBO(224, 150, 65, 1);
BoxShadow boxshadow = BoxShadow(
  offset: const Offset(0, -15),
  blurRadius: 20,
  color: const Color(0xFFDADADA).withOpacity(0.15),
);

class Sizes {
  static height(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static width(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }
}
