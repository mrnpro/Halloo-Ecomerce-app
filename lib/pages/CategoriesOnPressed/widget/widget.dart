import 'package:flutter/material.dart';

class CutomAppBar extends StatelessWidget {
  const CutomAppBar({Key? key, required this.categorie}) : super(key: key);
  final categorie;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios)),
        Text(
          categorie,
          style: TextStyle(fontSize: 20),
        ),
        IconButton(
            color: Colors.orange,
            onPressed: () {},
            icon: const Icon(Icons.search)),
      ],
    );
  }
}
