import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:hallo_shop/pages/Home/futured/model.dart';
import 'package:hallo_shop/pages/Home/futured/widget/scroll_items.dart';

import '../../../service/firebase_db_service.dart';
import '../../Detail Page/detail.dart';

class Futured extends StatelessWidget {
  const Futured({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          StreamBuilder<QuerySnapshot>(
              stream: Db().productsRec.snapshots(),
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
              })
        ],
      ),
    );
  }
}
