import 'package:firebase_auth/firebase_auth.dart';
class AuthState {
  //initialize firebaseAuth
  final auth = FirebaseAuth.instance;
  // checks if the user is not null if null it will return false, else true
  bool check() {
    return auth.currentUser != null;
  }

}
