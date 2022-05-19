import 'package:flutter/material.dart';
import 'package:hallo_shop/constant.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({Key? key, this.icon, required this.text})
      : super(key: key);
  final IconData? icon;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(13),
      child: Column(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
                color: kslightGray, borderRadius: BorderRadius.circular(40)),
            child: Center(child: Icon(icon)),
          ),
          const SizedBox(
            height: 13,
          ),
          Center(
            child: Text(text),
          )
        ],
      ),
    );
  }
}
