import 'package:flutter/material.dart';
import 'package:hallo_shop/pages/CategoriesOnPressed/items/items.dart';
import 'package:hallo_shop/pages/CategoriesOnPressed/widget/widget.dart';

class CategorieOnpress extends StatelessWidget {
  const CategorieOnpress({Key? key, required this.categorie}) : super(key: key);
  final String categorie;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(children: [
            CutomAppBar(categorie: categorie),
            const Divider(),
            Expanded(
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  Items(
                    categorie: categorie,
                  )
                ],
              ),
            ),
          ])),
    ));
  }
}
