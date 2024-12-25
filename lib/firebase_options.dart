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
    apiKey: 'AIzaSyCLY_5nrqWnebqXPljudaZD5A979dJtGGE',
    appId: '1:500310133531:web:e93eac71c79bf2c42561be',
    messagingSenderId: '500310133531',
    projectId: 'foodapp-b183b',
    authDomain: 'foodapp-b183b.firebaseapp.com',
    storageBucket: 'foodapp-b183b.appspot.com',
    measurementId: 'G-HJRY6CWMZD',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCPZpfs2mnETOGfP4BKmt2ZKepmRkhL7y0',
    appId: '1:500310133531:android:de74239efdbba22e2561be',
    messagingSenderId: '500310133531',
    projectId: 'foodapp-b183b',
    storageBucket: 'foodapp-b183b.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBK36l5bJitkH-4J8Vby63r3jCPeql_5TM',
    appId: '1:500310133531:ios:fae95d0731b1ec692561be',
    messagingSenderId: '500310133531',
    projectId: 'foodapp-b183b',
    storageBucket: 'foodapp-b183b.appspot.com',
    iosBundleId: 'com.cds.food',
  );
}
