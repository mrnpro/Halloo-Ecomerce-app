import 'package:flutter/material.dart';
import 'package:hallo_shop/pages/Home/category/category.dart';
import 'package:hallo_shop/pages/Home/futured/futured.dart';
import 'package:hallo_shop/pages/Home/widget/search.dart';

import '../../BottomNavigation/bottom_navigation.dart';

import 'TopPart/top_Part.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomNavigation(
        index: 0,
      ),
      body: SafeArea(
          child: ListView(
        physics: const BouncingScrollPhysics(),
        children: const [
          TopPart(),
          Divider(),
          SearchBTN(),
          SizedBox(
            height: 20,
          ),
          //const Divider(),
          Categories(),
          Divider(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Futured",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )),
          ),
          Futured()
        ],
      )),
    );
  }
}
