// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return macos;
      case TargetPlatform.windows:
        return windows;
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
    apiKey: 'AIzaSyAu-E7V6s4kY1kcFyCEUTcTEXpvpxAVbOw',
    appId: '1:45680033432:web:53f2e1f2651e6b54e25aed',
    messagingSenderId: '45680033432',
    projectId: 'fir-learning-def08',
    authDomain: 'fir-learning-def08.firebaseapp.com',
    storageBucket: 'fir-learning-def08.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBcdM0MBAIEhzj-1sSjZAMBgGnD468cAEw',
    appId: '1:45680033432:android:37cc7899ab15e245e25aed',
    messagingSenderId: '45680033432',
    projectId: 'fir-learning-def08',
    storageBucket: 'fir-learning-def08.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA3AJRInK9sFfz4TYsCsVKm7_8cQ3bcwBU',
    appId: '1:45680033432:ios:9aa7650b8d0ea8b5e25aed',
    messagingSenderId: '45680033432',
    projectId: 'fir-learning-def08',
    storageBucket: 'fir-learning-def08.appspot.com',
    iosBundleId: 'com.example.firebaseRlt',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA3AJRInK9sFfz4TYsCsVKm7_8cQ3bcwBU',
    appId: '1:45680033432:ios:9aa7650b8d0ea8b5e25aed',
    messagingSenderId: '45680033432',
    projectId: 'fir-learning-def08',
    storageBucket: 'fir-learning-def08.appspot.com',
    iosBundleId: 'com.example.firebaseRlt',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAu-E7V6s4kY1kcFyCEUTcTEXpvpxAVbOw',
    appId: '1:45680033432:web:f32811203259fc4be25aed',
    messagingSenderId: '45680033432',
    projectId: 'fir-learning-def08',
    authDomain: 'fir-learning-def08.firebaseapp.com',
    storageBucket: 'fir-learning-def08.appspot.com',
  );

}