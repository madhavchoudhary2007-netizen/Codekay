/// Login and registration screen
///
/// Provides UI for user authentication including both sign-in and sign-up.
library;

import 'package:flutter/material.dart';
import '../services/auth_service.dart';

/// Screen widget for user authentication
///
/// Displays a form for email and password authentication with the ability
/// to toggle between login and sign-up modes. Handles authentication errors
/// and provides user feedback through snackbars.
class LoginScreen extends StatefulWidget {
  /// Creates a login screen widget
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  /// Controller for the email input field
  final _emailController = TextEditingController();

  /// Controller for the password input field
  final _passwordController = TextEditingController();

  /// Whether the screen is in login mode (true) or sign-up mode (false)
  bool _isLogin = true;

  /// Whether an authentication operation is currently in progress
  bool _isLoading = false;

  /// Performs authentication based on current mode
  ///
  /// Attempts to either sign in or create a new account depending on
  /// the [_isLogin] state. Shows error messages if authentication fails.
  Future<void> _authenticate() async {
    setState(() => _isLoading = true);

    try {
      if (_isLogin) {
        // Attempt to sign in with existing credentials
        await AuthService.instance.signInWithEmailAndPassword(
          email: _emailController.text,
          password: _passwordController.text,
        );
      } else {
        // Attempt to create a new account
        await AuthService.instance.createUserWithEmailAndPassword(
          email: _emailController.text,
          password: _passwordController.text,
        );
      }
    } catch (e) {
      // Show error message to user
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.toString())),
        );
      }
    } finally {
      // Reset loading state
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_isLogin ? 'Login' : 'Sign Up'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Application icon
            const Icon(
              Icons.code,
              size: 80,
              color: Colors.deepPurple,
            ),
            const SizedBox(height: 24),

            // Email input field
            TextField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.email),
              ),
            ),
            const SizedBox(height: 16),

            // Password input field
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.lock),
              ),
            ),
            const SizedBox(height: 24),

            // Submit button or loading indicator
            if (_isLoading)
              const CircularProgressIndicator()
            else
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _authenticate,
                  child: Text(_isLogin ? 'Login' : 'Sign Up'),
                ),
              ),

            // Toggle between login and sign-up mode
            TextButton(
              onPressed: () => setState(() => _isLogin = !_isLogin),
              child: Text(
                _isLogin ? 'Create Account' : 'Have Account? Login',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
