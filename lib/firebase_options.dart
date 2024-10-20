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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCVXcVdqBNQzbSgXGcdK2icZsclgB80zqg',
    appId: '1:914226878912:android:431f0e4567982763fb5025',
    messagingSenderId: '914226878912',
    projectId: 'diapets',
    storageBucket: 'diapets.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCoNkPywuJ-zTZa95ZHOibvgiN71Hs0efw',
    appId: '1:914226878912:ios:16b3b5d4fecfd8d4fb5025',
    messagingSenderId: '914226878912',
    projectId: 'diapets',
    storageBucket: 'diapets.appspot.com',
    iosBundleId: 'com.example.diapetsMobile',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCoNkPywuJ-zTZa95ZHOibvgiN71Hs0efw',
    appId: '1:914226878912:ios:16b3b5d4fecfd8d4fb5025',
    messagingSenderId: '914226878912',
    projectId: 'diapets',
    storageBucket: 'diapets.appspot.com',
    iosBundleId: 'com.example.diapetsMobile',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAHO1Dw329T6pjl90R40t92FWuHmBRtBe4',
    appId: '1:914226878912:web:fd544e4ec13ae61dfb5025',
    messagingSenderId: '914226878912',
    projectId: 'diapets',
    authDomain: 'diapets.firebaseapp.com',
    storageBucket: 'diapets.appspot.com',
    measurementId: 'G-5QG288B5ZQ',
  );

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyAHO1Dw329T6pjl90R40t92FWuHmBRtBe4',
    appId: '1:914226878912:web:fd544e4ec13ae61dfb5025',
    messagingSenderId: '914226878912',
    projectId: 'diapets',
    authDomain: 'diapets.firebaseapp.com',
    storageBucket: 'diapets.appspot.com',
    measurementId: 'G-5QG288B5ZQ',
  );
}
