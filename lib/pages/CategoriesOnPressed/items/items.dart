import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hallo_shop/pages/CategoriesOnPressed/items/model.dart';
import 'package:hallo_shop/pages/CategoriesOnPressed/items/widget/scroll_items.dart';
import 'package:hallo_shop/pages/Detail%20Page/detail.dart';

import '../../../service/firebase_db_service.dart';

class Items extends StatelessWidget {
  const Items({Key? key, required this.categorie}) : super(key: key);
  final String categorie;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        StreamBuilder<QuerySnapshot>(
            stream: Db()
                .productsRec
                .where("category", isEqualTo: categorie)
                .snapshots(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: Text("pease wait... "),
                );
              }
              if (snapshot.hasError) {
                return Center(
                  child: Text(snapshot.error.toString()),
                );
              }
              if (snapshot.hasData) {
                return GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisSpacing: 20,
                        crossAxisCount: 2,
                        childAspectRatio: MediaQuery.of(context).size.width /
                            (MediaQuery.of(context).size.height) /
                            1.2),
                    itemCount: snapshot.data.docs.length,
                    itemBuilder: (BuildContext context, index) {
                      return ScrollItems(
                        price: snapshot.data.docs[index]['price'],
                        title: snapshot.data.docs[index]['title'],
                        url: snapshot.data.docs[index]['url'][0],
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Detail(
                                        title: snapshot.data.docs[index]
                                            ['title'],
                                        price: snapshot.data.docs[index]
                                            ['price'],
                                        url: snapshot.data.docs[index]['url'],
                                      )));
                        },
                      );
                    });
              } else {
                return const Center(
                  child: Text("there is no post"),
                );
              }
            }),
      ],
    );
  }
}
