// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:hallo_shop/pages/chat/chat.dart';
//import 'package:hallo_shop/pages/chat/chat.dart';
//import 'package:hallo_shop/pages/chat/model/model.dart';

class ListCard extends StatelessWidget {
  const ListCard(
      {Key? key, this.userName, this.img, required this.isOnline, this.time})
      : super(key: key);
  final userName;
  final img;
  final isOnline;
  final time;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return Chat();
        }));
      },
      child: Container(
          margin: const EdgeInsets.symmetric(vertical: 5),
          height: 70,
          decoration: const BoxDecoration(
            border: Border(
                bottom: BorderSide(
              width: 1,
            )),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Stack(
                children: [
                  Container(
                    margin:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: CircleAvatar(
                        radius: 30,
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              image: DecorationImage(
                                  image: NetworkImage(img), fit: BoxFit.cover)),
                        )),
                  ),
                  Positioned(
                    top: 47,
                    right: 11,
                    child: CircleAvatar(
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(width: 2.5, color: Colors.white),
                            borderRadius: BorderRadius.circular(50)),
                      ),
                      radius: 10,
                      backgroundColor: isOnline ? Colors.green : Colors.grey,
                    ),
                  ),
                ],
              ),
              Container(
                width: MediaQuery.of(context).size.width / 2,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  userName,
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(right: 10),
                child: Text(
                  "${time.hour}:${time.minute}",
                  style: const TextStyle(color: Colors.grey, fontSize: 18),
                ),
              )
            ],
          )),
    );
  }
}
