import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hallo_shop/pages/login/welcome_page.dart';

import 'profile_menu.dart';
import 'profilepicture.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          const ProfilePic(),
          const SizedBox(height: 20),
          ProfileMenu(
            text: "My Uploads",
            icon: "",
            press: () => {},
          ),
          ProfileMenu(
            text: "Notifications",
            icon: "",
            press: () {},
          ),
          ProfileMenu(
            text: "Settings",
            icon: "",
            press: () {},
          ),
          ProfileMenu(
            text: "Help Center",
            icon: "",
            press: () {},
          ),
          ProfileMenu(
            text: "Log Out",
            icon: "assets/icons/Log out.svg",
            press: () async {
              await FirebaseAuth.instance.signOut();

              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const WelcomePage()),
                (Route<dynamic> route) => false,
              );
            },
          ),
        ],
      ),
    );
  }
}
