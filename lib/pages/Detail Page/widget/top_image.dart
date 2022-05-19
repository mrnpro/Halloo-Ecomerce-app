import 'package:flutter/material.dart';

import '../../../constant.dart';

class TopImageAnd extends StatefulWidget {
  const TopImageAnd({Key? key, required this.url}) : super(key: key);
  final List url;

  @override
  State<TopImageAnd> createState() => _TopImageAndState();
}

class _TopImageAndState extends State<TopImageAnd> {
  int index = 0;
  increament() {
    if (widget.url.asMap().containsKey(index + 1)) {
      setState(() {
        index++;
      });
    }
  }

  decreament() {
    if (widget.url.asMap().containsKey(index - 1)) {
      setState(() {
        index--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        InteractiveViewer(
          child: Container(
            decoration: BoxDecoration(
                color: kslightGray,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(widget.url[index]),
                )),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 2,
          ),
        ),
        Positioned(
            right: 10,
            top: MediaQuery.of(context).size.height / 4,
            child: IconButton(
                onPressed: () {
                  increament();
                },
                icon: const Icon(Icons.arrow_forward_ios))),
        Positioned(
            left: 10,
            top: MediaQuery.of(context).size.height / 4,
            child: IconButton(
                onPressed: () {
                  decreament();
                },
                icon: const Icon(Icons.arrow_back_ios))),
        Positioned(
            top: 10,
            left: 10,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(40)),
              child: IconButton(
                  icon: const Icon(Icons.arrow_back_ios),
                  onPressed: (() {
                    Navigator.pop(context);
                  })),
            ))
      ],
    );
  }
}
