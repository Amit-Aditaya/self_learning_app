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
    apiKey: 'AIzaSyCDJfVW-hZVzrkQUlhwfamHi8a0uCUC1Ko',
    appId: '1:405700654546:web:940be3a6cd2fa96296840b',
    messagingSenderId: '405700654546',
    projectId: 'self-learning-app-2bd09',
    authDomain: 'self-learning-app-2bd09.firebaseapp.com',
    storageBucket: 'self-learning-app-2bd09.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDQX7TXJWJ0r0BQXnuNOQyhKvof1THOX8A',
    appId: '1:405700654546:android:e53f6bd696e1582496840b',
    messagingSenderId: '405700654546',
    projectId: 'self-learning-app-2bd09',
    storageBucket: 'self-learning-app-2bd09.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDo-0BCHUNorA-y-Bblzk8FiqZzl4erAr0',
    appId: '1:405700654546:ios:6f7d86d91431672696840b',
    messagingSenderId: '405700654546',
    projectId: 'self-learning-app-2bd09',
    storageBucket: 'self-learning-app-2bd09.appspot.com',
    iosClientId: '405700654546-hbe0d77m9g56if72hsg5car6fg07f1im.apps.googleusercontent.com',
    iosBundleId: 'com.example.selfLearningApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDo-0BCHUNorA-y-Bblzk8FiqZzl4erAr0',
    appId: '1:405700654546:ios:6f7d86d91431672696840b',
    messagingSenderId: '405700654546',
    projectId: 'self-learning-app-2bd09',
    storageBucket: 'self-learning-app-2bd09.appspot.com',
    iosClientId: '405700654546-hbe0d77m9g56if72hsg5car6fg07f1im.apps.googleusercontent.com',
    iosBundleId: 'com.example.selfLearningApp',
  );
}
