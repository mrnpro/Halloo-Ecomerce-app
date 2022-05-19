import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hallo_shop/enum/categories.dart';
import 'package:hallo_shop/service/auth_state_check.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

class Db {
  CollectionReference userec =
      FirebaseFirestore.instance.collection("ecomerce users");
  CollectionReference productsRec =
      FirebaseFirestore.instance.collection("ecomerce products");

  Future<bool> isUserProfile() async {
    DocumentSnapshot snapshot;
    try {
      snapshot = await userec.doc(AuthState().auth.currentUser!.uid).get();
      return Future<bool>.value(snapshot.exists);
    } catch (e) {
      print(e);
    }
    return false;
  }

  Future userSignUp(String role, String name) async {
    await userec
        .doc(AuthState().auth.currentUser!.uid)
        .set({name: name, "role": role});
  }

  Future post(categoriesEnum? cat, List<XFile>? img, String title, String price,
      String description) async {
    var category;
    if (cat == categoriesEnum.tv) {
      category = "tv";
    } else if (cat == categoriesEnum.fridge) {
      category = "fridge";
    } else if (cat == categoriesEnum.receiver) {
      category = "receiver";
    } else if (cat == categoriesEnum.other) {
      category = "other";
    }

    print(cat);
    List<String> imgname = [];
    List<String> downloadedurl = [];
    print("called");
    try {
      for (int i = 0; i < img!.length; i++) {
        imgname.add(productsRec.doc().id);
        await FirebaseStorage.instance
            .ref('profileimages/${imgname.elementAt(i)}')
            .putFile(File(img[i].path))
            .whenComplete(() async {
          print("uploaded");
        });
      }

      for (int i = 0; i < img.length; i++) {
        downloadedurl.add(await FirebaseStorage.instance
            .ref('profileimages/${imgname.elementAt(i)}')
            .getDownloadURL());
      }

      print(downloadedurl);
    } catch (e) {
      print("you have error on upload " + e.toString());
    }
    await productsRec.add({
      'title': title,
      'description': description,
      'price': price,
      'category': category,
      'url': downloadedurl
    });
    print('post complete');
  }
}
