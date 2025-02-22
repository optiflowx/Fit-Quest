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
    apiKey: 'AIzaSyApN1jKu8cXDMFzfE0ubYMJy3XzjIkRwCM',
    appId: '1:437963810052:web:b8e568a7c5261becc29c51',
    messagingSenderId: '437963810052',
    projectId: 'fit-quest-flutter-project',
    authDomain: 'fit-quest-flutter-project.firebaseapp.com',
    storageBucket: 'fit-quest-flutter-project.firebasestorage.app',
    measurementId: 'G-988NB8452N',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBjN8HrY7U-IomRn2YT5bjGpkv8CtF06Eo',
    appId: '1:437963810052:android:df2642b70f35cdddc29c51',
    messagingSenderId: '437963810052',
    projectId: 'fit-quest-flutter-project',
    storageBucket: 'fit-quest-flutter-project.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCKX-Ltx5Uhfx8LUpHcAvsh-Hw_MQpDU2s',
    appId: '1:437963810052:ios:90347774cc8ba68ac29c51',
    messagingSenderId: '437963810052',
    projectId: 'fit-quest-flutter-project',
    storageBucket: 'fit-quest-flutter-project.firebasestorage.app',
    iosBundleId: 'com.example.fitQuest',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCKX-Ltx5Uhfx8LUpHcAvsh-Hw_MQpDU2s',
    appId: '1:437963810052:ios:90347774cc8ba68ac29c51',
    messagingSenderId: '437963810052',
    projectId: 'fit-quest-flutter-project',
    storageBucket: 'fit-quest-flutter-project.firebasestorage.app',
    iosBundleId: 'com.example.fitQuest',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyApN1jKu8cXDMFzfE0ubYMJy3XzjIkRwCM',
    appId: '1:437963810052:web:ec77e94e30655fa9c29c51',
    messagingSenderId: '437963810052',
    projectId: 'fit-quest-flutter-project',
    authDomain: 'fit-quest-flutter-project.firebaseapp.com',
    storageBucket: 'fit-quest-flutter-project.firebasestorage.app',
    measurementId: 'G-1JBPLJKHCY',
  );
}
