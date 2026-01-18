/// Firebase configuration and initialization
///
/// This module handles all Firebase-related configuration and provides
/// a centralized initialization point for the application's Firebase services.
library;

import 'package:firebase_core/firebase_core.dart';

/// Firebase configuration options for the application
///
/// These values are configured for the Codekay project and should be
/// updated when deploying to your own Firebase project.
///
/// **IMPORTANT**: For production deployments, these credentials should be
/// replaced with your own Firebase project credentials. You can obtain these
/// from the Firebase Console (Project Settings > General > Your apps).
class FirebaseConfig {
  /// Private constructor to prevent instantiation
  FirebaseConfig._();

  /// Firebase options for platform initialization
  ///
  /// Contains the necessary credentials and identifiers for connecting
  /// to the Firebase backend services including Authentication and Firestore.
  ///
  /// Update these values with your own Firebase project credentials before
  /// deploying to production. See README.md for configuration instructions.
  static const FirebaseOptions firebaseOptions = FirebaseOptions(
    apiKey: 'AIzaSyDZbSwBs1lvHhRB8AKvsia2I2FjnUaF61I',
    appId: '1:605099861833:android:51a883e5599f4f35951c98',
    messagingSenderId: '605099861833',
    projectId: 'codekay-4fe2a',
    storageBucket: 'codekay-4fe2a.firebasestorage.app',
  );

  /// Initializes Firebase with the configured options
  ///
  /// This method should be called once during application startup,
  /// typically in the main() function before running the app.
  ///
  /// Throws [FirebaseException] if initialization fails.
  static Future<void> initialize() async {
    await Firebase.initializeApp(options: firebaseOptions);
  }
}
