import 'package:flutter/material.dart';

import 'package:hallo_shop/pages/login/sign_up.dart';
import 'package:hallo_shop/pages/login/widget/button.dart';
import 'package:hallo_shop/service/google_auth.dart';
import 'package:hallo_shop/wrapper.dart';
import 'package:pinput/pinput.dart';

import '../../constant.dart';
import 'widget/welcome_text.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final _formKey = GlobalKey<FormState>();
  //checks if the user pressed the login button
  var _isPressed = true;
  //pin theme for pin textfield
  final pinTheme = PinTheme(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
          border: Border.all(color: kprimary),
          borderRadius: BorderRadius.circular(10)));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        controller: ScrollController(),
        children: [
          Container(
            width: Sizes.width(context) - 50,
            height: Sizes.height(context) / 1.5,
            padding: const EdgeInsets.all(20),
            margin: EdgeInsets.only(
                left: 10, right: 10, top: Sizes.height(context) / 9),
            decoration: BoxDecoration(
                boxShadow: [boxshadow],
                borderRadius: BorderRadius.circular(10),
                color: Colors.white),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const WelcomeText(),
                Form(
                    key: _formKey,
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: const [PhoneNumber()],
                      ),
                    )),
                SMSInput(pinTheme: pinTheme),
                TextButton(
                    style: TextButton.styleFrom(padding: EdgeInsets.zero),
                    onPressed: () {
                      setState(() {
                        if (_isPressed == true) {
                          _isPressed = false;
                        } else if (_isPressed == false) {
                          _isPressed = true;
                        }
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.only(left: 20, right: 20),
                      child: Center(
                          child: Text(
                        _isPressed ? "Resend" : "Get SMS code",
                        style: const TextStyle(color: kprimary, fontSize: 20),
                      )),
                    )),
                CustomButton(
                  text: "Login",
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return SignUp();
                    }));
                  },
                ),
              ],
            ),
          ),
          const Text(
            "+",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20),
          ),
          TextButton(
              style: TextButton.styleFrom(padding: EdgeInsets.zero),
              onPressed: () async {
                GoogleAuth()
                    .signInWithGoogle()
                    .whenComplete(() => Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Wrapper()),
                          (Route<dynamic> route) => false,
                        ));
              },
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                    border: Border.all(
                        color: const Color.fromARGB(255, 216, 214, 214),
                        width: 1),
                    borderRadius: BorderRadius.circular(10)),
                margin: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.transparent,
                      child: Container(
                          padding: const EdgeInsets.all(7),
                          width: 50,
                          height: 50,
                          child: Image.asset(
                            "assets/image/google.png",
                            fit: BoxFit.cover,
                          )),
                    ),
                    const Text(
                      "Continue with Google",
                      style: TextStyle(
                          color: Color.fromARGB(255, 85, 85, 85), fontSize: 20),
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
//sms input 
class SMSInput extends StatelessWidget {
  const SMSInput({
    Key? key,
    required this.pinTheme,
  }) : super(key: key);

  final PinTheme pinTheme;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 40, bottom: 30),
          child: Pinput(
            length: 6,
            defaultPinTheme: pinTheme,
          ),
        ),
      ],
    );
  }
}
//phone number textfield
class PhoneNumber extends StatelessWidget {
  const PhoneNumber({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: const InputDecoration(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: kprimary, width: 2),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: kprimary, width: 2),
          ),
          focusColor: Colors.orange,
          hoverColor: Colors.orange,
          labelText: 'phone',
          labelStyle: TextStyle(color: Colors.orange)),
    );
  }
}
