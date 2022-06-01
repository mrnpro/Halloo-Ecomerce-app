import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hallo_shop/pages/Home/home.dart';
import 'package:hallo_shop/pages/chat/chat.dart';
import 'package:hallo_shop/pages/chat/chat_room.dart';

import 'package:hallo_shop/pages/profile/profile.dart';
import 'package:hallo_shop/pages/upload/upload.dart';
import 'package:hallo_shop/service/auth_state_check.dart';
import 'package:hallo_shop/service/firebase_db_service.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key, required this.index}) : super(key: key);
  // index here helps us to know which bottom item is the page want
  final int index;
  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  @override
  Widget build(BuildContext context) {
    //custom navigation to minimize the code / to make it easy to code :)
    _customNav(Widget destination) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => destination),
        (Route<dynamic> route) => false,
      );
    }

    return FutureBuilder<DocumentSnapshot>(
     
      future: Db().userec.doc(AuthState().auth.currentUser!.uid).get(),
      builder: (context, AsyncSnapshot snapshot) => SalomonBottomBar(
        currentIndex: widget.index,
        onTap: (i) async {
          if (snapshot.hasData) {
            if (snapshot.data['role'] == 'Seller') {
              setState(() => {
                    if (i == 0)
                      {_customNav(const Home())}
                    else if (i == 1)
                      {
                        //customNav(const Home())
                      }
                    else if (i == 2)
                      {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Upload()))
                      }
                    else if (i == 3)
                      {
                        _customNav(ChatApp(
                          index: i,
                        ))
                      }
                    else if (i == 4)
                      {
                        _customNav(ProfileScreen(
                          index: i,
                        ))
                      }
                  });
            }
            //if the user of the app is not seller
            else {
              setState(() => {
                    if (i == 0)
                      {_customNav(const Home())}
                    else if (i == 1)
                      {
                        //customNav(const Home())
                      }
                    else if (i == 2)
                      {
                        _customNav(ChatApp(
                          index: i,
                        ))
                      }
                    else if (i == 3)
                      {
                        _customNav(ProfileScreen(
                          index: i,
                        ))
                      }
                  });
            }
          }
        },
        items: [
          /// Home
          SalomonBottomBarItem(
            icon: const Icon(Icons.home),
            title: const Text("Home"),
            selectedColor: Colors.orange,
          ),

          SalomonBottomBarItem(
            icon: const Icon(Icons.favorite_border),
            title: const Text("Wishlists"),
            selectedColor: Colors.orange,
          ),
          if (snapshot.hasData)
            if (snapshot.data['role'] == "Seller")
              SalomonBottomBarItem(
                icon: const Icon(Icons.photo_camera),
                title: const Text("Upload"),
                selectedColor: Colors.orange,
              )

          //post
          ,
          //chat
          SalomonBottomBarItem(
            icon: const Icon(Icons.chat),
            title: const Text("Chat"),
            selectedColor: Colors.orange,
          ),

          /// Profile
          SalomonBottomBarItem(
            icon: const Icon(Icons.person),
            title: const Text("Account"),
            selectedColor: Colors.orange,
          ),
        ],
      ),
    );
  }
}
