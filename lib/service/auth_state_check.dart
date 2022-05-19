import 'package:firebase_auth/firebase_auth.dart';

class AuthState {
  final auth = FirebaseAuth.instance;
  bool check() {
    return auth.currentUser != null;
  }

  getpage() {}
}
