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
    apiKey: 'AIzaSyDkf8EgqrcdjazO_JCUtJ7Tj2Oogb29g4A',
    appId: '1:105216623590:web:0ccd972fe831df245f8c27',
    messagingSenderId: '105216623590',
    projectId: 'minimalchatapp-c4129',
    authDomain: 'minimalchatapp-c4129.firebaseapp.com',
    databaseURL: 'https://minimalchatapp-c4129-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'minimalchatapp-c4129.appspot.com',
    measurementId: 'G-5JL0D2ZZD5',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBLP1sCplDQNiXaR45k_qJLdsZBviqe-VY',
    appId: '1:105216623590:android:214e353d45b7cdfc5f8c27',
    messagingSenderId: '105216623590',
    projectId: 'minimalchatapp-c4129',
    databaseURL: 'https://minimalchatapp-c4129-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'minimalchatapp-c4129.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBvy4actJfbluavMSAZu6mYVHHD2oewpec',
    appId: '1:105216623590:ios:59353ad1af75b3575f8c27',
    messagingSenderId: '105216623590',
    projectId: 'minimalchatapp-c4129',
    databaseURL: 'https://minimalchatapp-c4129-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'minimalchatapp-c4129.appspot.com',
    iosBundleId: 'com.example.minimalChatApp',
  );
}
