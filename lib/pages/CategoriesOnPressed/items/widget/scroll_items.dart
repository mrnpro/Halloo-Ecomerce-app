import 'package:flutter/material.dart';

import '../../../../constant.dart';

class ScrollItems extends StatelessWidget {
  const ScrollItems(
      {Key? key,
      required this.title,
      required this.price,
      required this.url,
      required this.onPressed})
      : super(key: key);
  final String title;
  final String price;
  final String url;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onPressed();
      },
      child: Column(children: [
        Container(
          height: 250,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                    url,
                  ),
                  fit: BoxFit.cover),
              color: kslightGray,
              borderRadius: BorderRadius.circular(10)),
        ),
        const SizedBox(
          height: 10,
        ),
        Align(
          alignment: Alignment.center,
          child: Column(
            children: [
              Text(
                title,
                softWrap: false,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 20),
              ),
              Text(price + " birr",maxLines: 1,
                overflow: TextOverflow.ellipsis,)
            ],
          ),
        )
      ]),
    );
  }
}
