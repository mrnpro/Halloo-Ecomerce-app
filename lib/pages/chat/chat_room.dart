import 'package:flutter/material.dart';
import 'package:hallo_shop/BottomNavigation/bottom_navigation.dart';
import 'package:hallo_shop/pages/chat/model/model.dart';
import 'package:hallo_shop/pages/chat/widget/list_card.dart';

class ChatApp extends StatelessWidget {
  ChatApp({Key? key, required this.index}) : super(key: key);
  final users = Users.getUser();
  final int index;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigation(index: index),
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text("Messages"),
        centerTitle: true,
      ),
      body: SafeArea(
          child: ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                return ListCard(
                  userName: users[index].user,
                  img: users[index].img,
                  isOnline: users[index].isOnline,
                  time: users[index].time,
                );
              })),
    );
  }
}
