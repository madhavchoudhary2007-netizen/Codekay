/// Codekay - Daily Coding Challenge Application
///
/// A cross-platform Flutter application that delivers daily coding challenges
/// to help developers improve their problem-solving skills. Features include
/// user authentication, question management via Firebase, and a clean,
/// intuitive interface for submitting solutions.
///
/// Built with Flutter for iOS, Android, Web, Windows, macOS, and Linux.
library;

import 'package:flutter/material.dart';
import 'config/firebase_config.dart';
import 'screens/auth_wrapper.dart';

/// Application entry point
///
/// Initializes Flutter bindings and Firebase before launching the app.
/// This ensures all necessary services are ready before the UI is displayed.
void main() async {
  // Ensure Flutter is properly initialized before async operations
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase services
  await FirebaseConfig.initialize();

  // Launch the application
  runApp(const CodekayApp());
}

/// Root application widget
///
/// Configures the MaterialApp with theme settings and sets up
/// the initial navigation structure using [AuthWrapper].
class CodekayApp extends StatelessWidget {
  /// Creates the root application widget
  const CodekayApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Application title shown in task switcher
      title: 'Codekay',

      // Visual theme configuration
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ),
        useMaterial3: true,
      ),

      // Disable debug banner in development mode
      debugShowCheckedModeBanner: false,

      // Initial route uses AuthWrapper to handle authentication state
      home: const AuthWrapper(),
    );
  }
}
