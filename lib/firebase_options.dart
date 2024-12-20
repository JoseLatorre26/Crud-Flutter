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
    apiKey: 'AIzaSyDAkpn5A1gprBudiIXvY0lQ2jk79qBSDBI',
    appId: '1:459839548031:web:2e5cdf8d2f161873782d4a',
    messagingSenderId: '459839548031',
    projectId: 'ventaautosog',
    authDomain: 'ventaautosog.firebaseapp.com',
    storageBucket: 'ventaautosog.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDNLie2EP5E1mpTcWAMCD8iwpni9Tr5jpo',
    appId: '1:459839548031:android:7631168cac1152b0782d4a',
    messagingSenderId: '459839548031',
    projectId: 'ventaautosog',
    storageBucket: 'ventaautosog.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD6nEVFUsggfFAFzIPtczJN45Blfnitwus',
    appId: '1:459839548031:ios:26a8b26b10d30420782d4a',
    messagingSenderId: '459839548031',
    projectId: 'ventaautosog',
    storageBucket: 'ventaautosog.firebasestorage.app',
    iosBundleId: 'com.example.crudFirebase',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyD6nEVFUsggfFAFzIPtczJN45Blfnitwus',
    appId: '1:459839548031:ios:26a8b26b10d30420782d4a',
    messagingSenderId: '459839548031',
    projectId: 'ventaautosog',
    storageBucket: 'ventaautosog.firebasestorage.app',
    iosBundleId: 'com.example.crudFirebase',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDAkpn5A1gprBudiIXvY0lQ2jk79qBSDBI',
    appId: '1:459839548031:web:86a8f2cdbd53e49f782d4a',
    messagingSenderId: '459839548031',
    projectId: 'ventaautosog',
    authDomain: 'ventaautosog.firebaseapp.com',
    storageBucket: 'ventaautosog.firebasestorage.app',
  );

}