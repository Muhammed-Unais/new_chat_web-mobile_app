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
    apiKey: 'AIzaSyDJJhOBKfVrZN-Zn0GFb66UNeMp9b_4ixc',
    appId: '1:369797449942:web:50ac6a5d653defc5fda177',
    messagingSenderId: '369797449942',
    projectId: 'new-chat-da5e1',
    authDomain: 'new-chat-da5e1.firebaseapp.com',
    storageBucket: 'new-chat-da5e1.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCKUr77wFFY8-zMtHvG4XlnFr8Aoy5KHI4',
    appId: '1:369797449942:android:7b91085b0e1ae1effda177',
    messagingSenderId: '369797449942',
    projectId: 'new-chat-da5e1',
    storageBucket: 'new-chat-da5e1.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBekkwR1NoUerKG6qdADaxcqxoFb9VaBhM',
    appId: '1:369797449942:ios:644b169387dc84f5fda177',
    messagingSenderId: '369797449942',
    projectId: 'new-chat-da5e1',
    storageBucket: 'new-chat-da5e1.appspot.com',
    iosClientId: '369797449942-rqkg60m4fd13buknbu72lv8o9lgt3ujo.apps.googleusercontent.com',
    iosBundleId: 'com.example.newChat',
  );
}
