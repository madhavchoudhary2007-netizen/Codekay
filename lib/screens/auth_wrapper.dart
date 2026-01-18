/// Authentication wrapper widget
///
/// Manages the routing between authenticated and unauthenticated states.
library;

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../services/auth_service.dart';
import 'login_screen.dart';
import 'home_screen.dart';

/// Widget that handles authentication state routing
///
/// Listens to authentication state changes and displays the appropriate
/// screen based on whether the user is authenticated or not.
///
/// Shows a loading indicator while checking authentication state,
/// the [LoginScreen] when not authenticated, and the [HomeScreen]
/// when authenticated.
class AuthWrapper extends StatelessWidget {
  /// Creates an authentication wrapper widget
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: AuthService.instance.authStateChanges,
      builder: (context, snapshot) {
        // Show loading indicator while checking auth state
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        // Show home screen if user is authenticated
        if (snapshot.hasData) {
          return const HomeScreen();
        }

        // Show login screen if user is not authenticated
        return const LoginScreen();
      },
    );
  }
}
