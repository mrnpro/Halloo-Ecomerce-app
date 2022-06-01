import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hallo_shop/enum/categories.dart';
import 'package:hallo_shop/service/auth_state_check.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
//Db is the service for database 
class Db {
  
  //users recored initialized
  CollectionReference userec =
      FirebaseFirestore.instance.collection("ecomerce users");
  
  //products record initialized
  CollectionReference productsRec =
      FirebaseFirestore.instance.collection("ecomerce products");
  
  //is user profile will check if the user is already a member of the platform .. if the document exist in users record , the user is not new .
  Future<bool> isUserProfile() async {
    DocumentSnapshot snapshot;
    try {
   
      snapshot = await userec.doc(AuthState().auth.currentUser!.uid).get();
         //check if the document exist through the current users uid
      return Future<bool>.value(snapshot.exists);
    } catch (e) {
      print(e);
    }
    return false;
  }
  //sign up user with role and username
  Future userSignUp(String role, String name) async {
    await userec
        .doc(AuthState().auth.currentUser!.uid)
        .set({name: name, "role": role});
  }
    // post to the database
  Future post(categoriesEnum? cat, List<XFile>? img, String title, String price,
      String description) async {
    var category;
    
   // extract information which enum item is selected and store the result in category variable  
    if (cat == categoriesEnum.tv) {
      category = "tv";
    } else if (cat == categoriesEnum.fridge) {
      category = "fridge";
    } else if (cat == categoriesEnum.receiver) {
      category = "receiver";
    } else if (cat == categoriesEnum.other) {
      category = "other";
    }

    // this imgname list will help us store images name which is  auto generated  unique id of the images of what we are going to post 
    List<String> imgname = [];
    
    //dowloadedurl will help us storing the downloaded urls after the image is stored in  firebase storage we need to link the url to our firestore db
    List<String> downloadedurl = [];
     
    try {
      
     //this loop will help us to post all the images we passed in 
      for (int i = 0; i < img!.length; i++) {
        //helps us unique id for images name then puts into imagename list
        imgname.add(productsRec.doc().id);
        //upload the images to firestore database assigning each name referencing with imagesname list through every iteration
        await FirebaseStorage.instance
            .ref('products/${imgname.elementAt(i)}')
            .putFile(File(img[i].path))
            .whenComplete(() async {
          print("uploaded");
        });
      }
        //downloads the images url  storing to downloadedurl list 
      for (int i = 0; i < img.length; i++) {
        downloadedurl.add(await FirebaseStorage.instance
            .ref('profileimages/${imgname.elementAt(i)}')
            .getDownloadURL());
      }

     
    } catch (e) {
      print("you have error on upload " + e.toString());
    }
    //put every information into firestore database
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
