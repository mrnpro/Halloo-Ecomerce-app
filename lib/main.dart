import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hallo_shop/wrapper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    theme: ThemeData(fontFamily: 'Poppins'),
    home: const Wrapper(),
    debugShowCheckedModeBanner: false,
  ));
}
