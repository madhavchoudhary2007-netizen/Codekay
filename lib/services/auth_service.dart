/// Authentication service for managing user authentication
///
/// This service provides a clean interface for all authentication-related
/// operations including sign-in, sign-up, sign-out, and auth state monitoring.
library;

import 'package:firebase_auth/firebase_auth.dart';

/// Service class that handles all authentication operations
///
/// Provides methods for user authentication and manages the current
/// authentication state through Firebase Authentication.
class AuthService {
  /// Private constructor to prevent direct instantiation
  AuthService._();

  /// Singleton instance of the authentication service
  static final AuthService instance = AuthService._();

  /// Firebase Authentication instance
  final FirebaseAuth _auth = FirebaseAuth.instance;

  /// Stream of authentication state changes
  ///
  /// Emits the current [User] when authenticated, or null when not authenticated.
  /// This stream can be used to reactively update UI based on auth state.
  Stream<User?> get authStateChanges => _auth.authStateChanges();

  /// Gets the currently authenticated user
  ///
  /// Returns the current [User] if authenticated, null otherwise.
  User? get currentUser => _auth.currentUser;

  /// Signs in a user with email and password
  ///
  /// [email] - The user's email address
  /// [password] - The user's password
  ///
  /// Returns a [UserCredential] upon successful authentication.
  /// Throws [FirebaseAuthException] if authentication fails.
  Future<UserCredential> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    return await _auth.signInWithEmailAndPassword(
      email: email.trim(),
      password: password,
    );
  }

  /// Creates a new user account with email and password
  ///
  /// [email] - The email address for the new account
  /// [password] - The password for the new account
  ///
  /// Returns a [UserCredential] upon successful account creation.
  /// Throws [FirebaseAuthException] if account creation fails.
  Future<UserCredential> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    return await _auth.createUserWithEmailAndPassword(
      email: email.trim(),
      password: password,
    );
  }

  /// Signs out the currently authenticated user
  ///
  /// Returns a [Future] that completes when sign-out is successful.
  /// Throws [FirebaseAuthException] if sign-out fails.
  Future<void> signOut() async {
    await _auth.signOut();
  }
}
