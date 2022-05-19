import 'package:flutter/material.dart';

class TopPart extends StatelessWidget {
  const TopPart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Align(
              alignment: Alignment.centerRight,
              child: Text(
                "700+ online",
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.green,
                    fontWeight: FontWeight.bold),
              )),
          Align(
            alignment: Alignment.centerRight,
            child: IconButton(
                splashColor: Colors.orangeAccent,
                color: Colors.orange,
                onPressed: () {},
                icon: const Icon(Icons.notifications)),
          ),
        ],
      ),
    );
  }
}
