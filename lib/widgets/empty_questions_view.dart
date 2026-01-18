/// Widget displayed when no questions are available
///
/// Shows helpful instructions for adding questions to the database.
library;

import 'package:flutter/material.dart';

/// Empty state view for when no questions exist
///
/// Provides guidance to users or administrators on how to add
/// questions to the Firestore database.
class EmptyQuestionsView extends StatelessWidget {
  /// Creates an empty questions view widget
  const EmptyQuestionsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Icon indicating empty state
            const Icon(
              Icons.quiz,
              size: 80,
              color: Colors.grey,
            ),
            const SizedBox(height: 16),

            // Main message
            const Text(
              'No questions available yet',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),

            // Instructions for adding questions
            Text(
              'Add questions in Firebase Console:\n'
              '1. Go to Firestore Database\n'
              '2. Create "questions" collection\n'
              '3. Add a question document',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey[600],
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
