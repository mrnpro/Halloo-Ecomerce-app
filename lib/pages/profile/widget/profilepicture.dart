import 'package:flutter/material.dart';
import 'package:hallo_shop/constant.dart';

class ProfilePic extends StatelessWidget {
  const ProfilePic({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 115,
      width: 115,
      child: Stack(
        fit: StackFit.expand,
        clipBehavior: Clip.none,
        children: [
          const CircleAvatar(
            backgroundColor: Color.fromARGB(255, 173, 154, 124),
            child: Icon(Icons.person),
          ),
          Positioned(
            right: -16,
            bottom: 0,
            child: SizedBox(
              height: 46,
              width: 46,
              child: TextButton(
                  style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                        side: const BorderSide(color: Colors.white),
                      ),
                      primary: Colors.orange,
                      backgroundColor: kslightGray),
                  onPressed: () {},
                  child: const Icon(Icons.photo_camera_front_rounded)),
            ),
          )
        ],
      ),
    );
  }
}
