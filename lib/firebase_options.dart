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
    apiKey: 'AIzaSyA-E2xEddGCFe9jLIcAfQ2K5nKMDNF7Fhs',
    appId: '1:924063783508:web:e5a9ad9da86950fb13abc1',
    messagingSenderId: '924063783508',
    projectId: 'food-app-fdad1',
    authDomain: 'food-app-fdad1.firebaseapp.com',
    storageBucket: 'food-app-fdad1.appspot.com',
    measurementId: 'G-43K168K225',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDtGJ8jQ4LaFv1QnNHhtlDA-08Cg46SFRk',
    appId: '1:924063783508:android:5f0b39a7dd8fbc9513abc1',
    messagingSenderId: '924063783508',
    projectId: 'food-app-fdad1',
    storageBucket: 'food-app-fdad1.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBNA-4AiRgfXoZy-jumDt8SnRkJcL_CAAg',
    appId: '1:924063783508:ios:726fdab1e9565f1f13abc1',
    messagingSenderId: '924063783508',
    projectId: 'food-app-fdad1',
    storageBucket: 'food-app-fdad1.appspot.com',
    iosBundleId: 'com.gamer.foodApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBNA-4AiRgfXoZy-jumDt8SnRkJcL_CAAg',
    appId: '1:924063783508:ios:726fdab1e9565f1f13abc1',
    messagingSenderId: '924063783508',
    projectId: 'food-app-fdad1',
    storageBucket: 'food-app-fdad1.appspot.com',
    iosBundleId: 'com.gamer.foodApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyA-E2xEddGCFe9jLIcAfQ2K5nKMDNF7Fhs',
    appId: '1:924063783508:web:4f38853ee1577abe13abc1',
    messagingSenderId: '924063783508',
    projectId: 'food-app-fdad1',
    authDomain: 'food-app-fdad1.firebaseapp.com',
    storageBucket: 'food-app-fdad1.appspot.com',
    measurementId: 'G-CRT7937Z5K',
  );
}
