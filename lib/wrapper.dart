import 'package:flutter/material.dart';
import 'package:hallo_shop/pages/Home/home.dart';
import 'package:hallo_shop/pages/login/sign_up.dart';
import 'package:hallo_shop/pages/login/welcome_page.dart';
import 'package:hallo_shop/service/auth_state_check.dart';
import 'package:hallo_shop/service/firebase_db_service.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AuthState().check()
        ? FutureBuilder(
            future: Db().isUserProfile(),
            builder: ((context, AsyncSnapshot<bool> snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data != true) {
                  return SignUp();
                }

                return const Home();
              } else {
                const WelcomePage();
              }
              return const Text("");
            }))
        : const WelcomePage();
  }
}
