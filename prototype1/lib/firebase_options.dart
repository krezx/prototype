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
    apiKey: 'AIzaSyBcAhvmfi9s2GghYJp_jkC-HJ6MkNysonU',
    appId: '1:456235517178:web:2a49c224ae4841b6237543',
    messagingSenderId: '456235517178',
    projectId: 'investigaucen',
    authDomain: 'investigaucen.firebaseapp.com',
    storageBucket: 'investigaucen.appspot.com',
    measurementId: 'G-4JJW9T0SG0',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCBX2fR4Q59XAq-yayKGakLkHZR2BonI-w',
    appId: '1:456235517178:android:3dc1897b6344e581237543',
    messagingSenderId: '456235517178',
    projectId: 'investigaucen',
    storageBucket: 'investigaucen.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCu92ePkvlaOZzJH13nuq4s3G4_AFm5KZw',
    appId: '1:456235517178:ios:de07372c16ba6493237543',
    messagingSenderId: '456235517178',
    projectId: 'investigaucen',
    storageBucket: 'investigaucen.appspot.com',
    iosBundleId: 'com.example.prototype1',
  );
}
