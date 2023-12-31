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
    apiKey: 'AIzaSyDx30D78mrbqoUpsJRUka1Vej6ImuXWH5c',
    appId: '1:1080527124141:web:7557bea28e1354d1fbb824',
    messagingSenderId: '1080527124141',
    projectId: 'hds-gworkspace-reseller',
    authDomain: 'hds-gworkspace-reseller.firebaseapp.com',
    databaseURL: 'https://hds-gworkspace-reseller-default-rtdb.firebaseio.com',
    storageBucket: 'hds-gworkspace-reseller.appspot.com',
    measurementId: 'G-7XNVBZF3TY',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAFmfTL_aAWeN_hCsslsxZ2Pr4rpazNvsg',
    appId: '1:1080527124141:android:ff5f22f57fa2f932fbb824',
    messagingSenderId: '1080527124141',
    projectId: 'hds-gworkspace-reseller',
    databaseURL: 'https://hds-gworkspace-reseller-default-rtdb.firebaseio.com',
    storageBucket: 'hds-gworkspace-reseller.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD0qJZz-nX-nkjVDMgrcfO2FktSTZHCGaY',
    appId: '1:1080527124141:ios:ee05d914251a9020fbb824',
    messagingSenderId: '1080527124141',
    projectId: 'hds-gworkspace-reseller',
    databaseURL: 'https://hds-gworkspace-reseller-default-rtdb.firebaseio.com',
    storageBucket: 'hds-gworkspace-reseller.appspot.com',
    iosClientId: '1080527124141-2r0dd0iq8e0bk3qleofp1q3rs056ab4o.apps.googleusercontent.com',
    iosBundleId: 'com.example.hdsApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyD0qJZz-nX-nkjVDMgrcfO2FktSTZHCGaY',
    appId: '1:1080527124141:ios:1ba780ad7bb298d6fbb824',
    messagingSenderId: '1080527124141',
    projectId: 'hds-gworkspace-reseller',
    databaseURL: 'https://hds-gworkspace-reseller-default-rtdb.firebaseio.com',
    storageBucket: 'hds-gworkspace-reseller.appspot.com',
    iosClientId: '1080527124141-oebd1k1chg7lvg8be9e2j6edbd6o9rdh.apps.googleusercontent.com',
    iosBundleId: 'com.example.hdsApp.RunnerTests',
  );
}
