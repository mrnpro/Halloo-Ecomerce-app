import 'package:flutter/material.dart';

import '../../../constant.dart';

class SearchBTN extends StatelessWidget {
  const SearchBTN({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        height: 50,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(80), color: kslightGray),
        child: Row(
          children: const [Icon(Icons.search), Text("  Search")],
        ),
      ),
    );
  }
}
