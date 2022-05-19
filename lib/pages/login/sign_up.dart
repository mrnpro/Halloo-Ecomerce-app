import 'package:flutter/material.dart';

import 'package:hallo_shop/pages/login/widget/button.dart';
import 'package:hallo_shop/service/firebase_db_service.dart';
import 'package:hallo_shop/wrapper.dart';

import '../../constant.dart';
import '../Home/home.dart';

class SignUp extends StatefulWidget {
  SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController name = TextEditingController();

  int? choosenValue;
  role() {
    switch (choosenValue) {
      case 1:
        return "Seller";
      case 2:
        return "Buyer";
    }
  }

  Db db = Db();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(controller: ScrollController(), children: [
      Container(
        width: Sizes.width(context) - 50,
        height: Sizes.height(context) / 2,
        margin: EdgeInsets.only(
            left: 10, right: 10, top: Sizes.height(context) / 5),
        decoration: BoxDecoration(
            boxShadow: [boxshadow],
            borderRadius: BorderRadius.circular(10),
            color: Colors.white),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text(
              "Sign Up,",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            Form(
                key: _formKey,
                child: Container(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: name,
                        decoration: const InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: kprimary, width: 2),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: kprimary, width: 2),
                            ),
                            focusColor: kprimary,
                            hoverColor: kprimary,
                            labelText: 'Name',
                            labelStyle: TextStyle(color: kprimary)),
                      ),
                      Container(
                        width: 500,
                        margin: const EdgeInsets.only(top: 20),
                        child: DropdownButton(
                            focusColor: kprimary,
                            autofocus: true,
                            value: choosenValue,
                            items: const [
                              DropdownMenuItem(
                                child: Text("Seller"),
                                value: 1,
                              ),
                              DropdownMenuItem(
                                child: Text("Buyer"),
                                value: 2,
                              )
                            ],
                            onChanged: (int? value) {
                              setState(() {
                                choosenValue = value;
                              });
                            }),
                      )
                    ],
                  ),
                )),
            CustomButton(
              text: "Sign UP",
              onPressed: () {
                db.userSignUp(role(), name.text).whenComplete(() => db
                    .isUserProfile()
                    .then((value) => Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const Wrapper();
                        }))));
              },
            ),
          ],
        ),
      )
    ]));
  }
}
