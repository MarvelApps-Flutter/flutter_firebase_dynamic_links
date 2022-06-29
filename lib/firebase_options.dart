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
    apiKey: 'AIzaSyBlvA_n7UwZDzLCp4ILKcXgOvAbsKluOGA',
    appId: '1:1066661077814:web:cfa8eb58deabd8550a0997',
    messagingSenderId: '1066661077814',
    projectId: 'dynamic-link-53407',
    authDomain: 'dynamic-link-53407.firebaseapp.com',
    storageBucket: 'dynamic-link-53407.appspot.com',
    measurementId: 'G-KC5EDVCBH7',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCEPJN3BCgY8_EtmWCQ5G3RUmH8W7CB8Bo',
    appId: '1:1066661077814:android:bbee509b5b8e1ee70a0997',
    messagingSenderId: '1066661077814',
    projectId: 'dynamic-link-53407',
    storageBucket: 'dynamic-link-53407.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAqOGCfxEZ8ViVrMw7bFSS4R0LPhVVrhz4',
    appId: '1:1066661077814:ios:292f3b49ae01db970a0997',
    messagingSenderId: '1066661077814',
    projectId: 'dynamic-link-53407',
    storageBucket: 'dynamic-link-53407.appspot.com',
    androidClientId: '1066661077814-is37g77f5lr54comi56bkrjuhbuidhbp.apps.googleusercontent.com',
    iosClientId: '1066661077814-urct7tssgh7u2dmjujg6kn8qfdjqmlcr.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterDynamicLinkApp',
  );
}
