import 'package:flutter/material.dart';
import 'package:hallo_shop/pages/CategoriesOnPressed/categories.dart';

import '../widget/categories_item.dart';

class Categories extends StatelessWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Categories",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              )),
        ),
        SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: () => {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CategorieOnpress(
                                categorie: "phones",
                              )))
                },
                child: const CategoryItem(
                  icon: Icons.smartphone,
                  text: "Phones",
                ),
              ),
              InkWell(
                onTap: () => {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CategorieOnpress(
                                categorie: "tv",
                              )))
                },
                child: const CategoryItem(
                  icon: Icons.tv,
                  text: "TV",
                ),
              ),
              InkWell(
                onTap: () => {
                  //Navigator.push(context,
                  //    MaterialPageRoute(builder: (context) => const Tv()))
                },
                child: const CategoryItem(
                  icon: Icons.tv,
                  text: "TV",
                ),
              ),
              InkWell(
                onTap: () => {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const CategorieOnpress(categorie: "fridge")))
                },
                child: const CategoryItem(
                  icon: Icons.tv,
                  text: "fridge",
                ),
              ),
              InkWell(
                onTap: () => {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CategorieOnpress(
                                categorie: "other",
                              )))
                },
                child: const CategoryItem(
                  icon: Icons.tv,
                  text: "other",
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
