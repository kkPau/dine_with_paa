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
    apiKey: 'AIzaSyAVhe53uaIAf61x6xNx_8bWk4MQ0ZKwnRA',
    appId: '1:769460518196:web:dd216e34e2e0fe1c1d3961',
    messagingSenderId: '769460518196',
    projectId: 'dinewithpaa',
    authDomain: 'dinewithpaa.firebaseapp.com',
    storageBucket: 'dinewithpaa.appspot.com',
    measurementId: 'G-RBDJNC0Z1N',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA5UEMAFlOH6v9q9h2As7OewbwBAPCZG9s',
    appId: '1:769460518196:android:857baf273aad34d41d3961',
    messagingSenderId: '769460518196',
    projectId: 'dinewithpaa',
    storageBucket: 'dinewithpaa.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCgUeKLsGNEF-SzF8w_yRJnvCvcUtjWn4k',
    appId: '1:769460518196:ios:c103e6efa104bd901d3961',
    messagingSenderId: '769460518196',
    projectId: 'dinewithpaa',
    storageBucket: 'dinewithpaa.appspot.com',
    iosBundleId: 'com.example.dineWithPaa',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCgUeKLsGNEF-SzF8w_yRJnvCvcUtjWn4k',
    appId: '1:769460518196:ios:4bc7c06f7f43775e1d3961',
    messagingSenderId: '769460518196',
    projectId: 'dinewithpaa',
    storageBucket: 'dinewithpaa.appspot.com',
    iosBundleId: 'com.example.dineWithPaa.RunnerTests',
  );
}
