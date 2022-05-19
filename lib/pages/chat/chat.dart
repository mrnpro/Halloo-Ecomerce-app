import 'package:flutter/material.dart';

class Chat extends StatefulWidget {
  const Chat({Key? key}) : super(key: key);

  @override
  State<Chat> createState() => _ChatState();
}

TextEditingController mymsg = TextEditingController();

class _ChatState extends State<Chat> {
  List<String> minechat = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          margin: const EdgeInsets.symmetric(horizontal: 5),
          child: const CircleAvatar(
            backgroundColor: Colors.white,
            child: Icon(Icons.person),
          ),
        ),
      ),
      body: SafeArea(
          child: Container(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            // Positioned(
            //   top: 62,
            //   child: ListView.builder(
            //       shrinkWrap: true,
            //       itemCount: 3,
            //       itemBuilder: ((context, index) => Text("sdf"))),
            // ),
            ListView.builder(
              itemCount: minechat.length,
              shrinkWrap: true,
              padding: const EdgeInsets.only(top: 62, bottom: 10),
              //physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Container(
                  padding: const EdgeInsets.only(
                      left: 16, right: 16, top: 10, bottom: 10),
                  child: Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 151, 151, 151),
                              borderRadius: BorderRadius.circular(5)),
                          padding: const EdgeInsets.all(13),
                          child: Text(minechat[index]))),
                );
              },
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(Icons.insert_emoticon_outlined),
                  ),
                  Text(
                    "i phone 20",
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
              height: 59,
              width: MediaQuery.of(context).size.width,
              color: const Color.fromRGBO(99, 97, 97, 1),
            ),
            Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  color: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 8,
                        //width: MediaQuery.of(context).size.width / 1.3,
                        child: TextField(
                          controller: mymsg,
                          decoration:
                              const InputDecoration(hintText: "send message"),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              minechat.add(mymsg.text);

                              mymsg.clear();
                            });
                          },
                          icon: const Icon(
                            Icons.send,
                            color: Colors.blue,
                          ),
                        ),
                      )
                    ],
                  ),
                ))
          ],
        ),
      )),
    );
  }
}
