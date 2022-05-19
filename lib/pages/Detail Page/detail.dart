import 'package:flutter/material.dart';

import 'widget/top_image.dart';

class Detail extends StatelessWidget {
  const Detail(
      {Key? key, required this.title, required this.price, required this.url})
      : super(key: key);
  final title;
  final price;
  final List url;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          TopImageAnd(
            url: url,
          ),
          Padding(
            padding: const EdgeInsets.all(8.20),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(title,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      )),
                ),
                const SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(price + " Birr"),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Details",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      )),
                ),
                const SizedBox(height: 10),
                Wrap(children: [])
              ],
            ),
          ),
        ],
      )),
    );
  }
}
