import 'package:flutter/material.dart';

class UploadAppBar extends StatefulWidget {
  const UploadAppBar({Key? key, this.onDonePressed}) : super(key: key);
  final VoidCallback? onDonePressed;
  @override
  State<UploadAppBar> createState() => _UploadAppBarState();
}

class _UploadAppBarState extends State<UploadAppBar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios)),
        const Text(
          "Upload ",
          style: TextStyle(fontSize: 20),
        ),
        IconButton(
            color: Colors.orange,
            onPressed: () => widget.onDonePressed,
            icon: const Icon(Icons.done))
      ],
    );
  }
}
