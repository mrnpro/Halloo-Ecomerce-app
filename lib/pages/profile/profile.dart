import 'package:flutter/material.dart';
import 'package:hallo_shop/BottomNavigation/bottom_navigation.dart';

import 'widget/body.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key, required this.index}) : super(key: key);
  final int index;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const SafeArea(child: Body()),
      bottomNavigationBar: BottomNavigation(index: index),
    );
  }
}
