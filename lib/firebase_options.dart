// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDIrQdkBhXQlVh1o4TsjzStdk8hrYPudYc',
    appId: '1:157841954848:web:9447f56b3572d460f1c445',
    messagingSenderId: '157841954848',
    projectId: 'sdfsdf-a17fc',
    authDomain: 'sdfsdf-a17fc.firebaseapp.com',
    storageBucket: 'sdfsdf-a17fc.appspot.com',
    measurementId: 'G-D5DW07D714',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBsuVQ-akoY0NRZAqllKCtEoUywabP6MlM',
    appId: '1:157841954848:android:baf3a337988614c3f1c445',
    messagingSenderId: '157841954848',
    projectId: 'sdfsdf-a17fc',
    storageBucket: 'sdfsdf-a17fc.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBVwXynHQxn7bOKDHbXqZnXuPShaKCmkKU',
    appId: '1:157841954848:ios:890797afe8ab08f5f1c445',
    messagingSenderId: '157841954848',
    projectId: 'sdfsdf-a17fc',
    storageBucket: 'sdfsdf-a17fc.appspot.com',
    androidClientId: '157841954848-0lkhcktanrg6881i0e09mt29jcf6ojs9.apps.googleusercontent.com',
    iosClientId: '157841954848-jfp00bo9dc71icgh50amq28o7choa25t.apps.googleusercontent.com',
    iosBundleId: 'com.mrnpro.halo.halloShop',
  );
}
