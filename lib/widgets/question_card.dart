/// Widget for displaying a coding question
///
/// Shows the question details including title, difficulty, and description.
library;

import 'package:flutter/material.dart';
import '../models/coding_question.dart';
import '../utils/theme_helper.dart';

/// Card widget that displays question information
///
/// Presents the coding question in a structured card format with
/// difficulty badge, title, description, and user information.
class QuestionCard extends StatelessWidget {
  /// The question data from Firestore
  final Map<String, dynamic> questionData;

  /// The email of the currently logged-in user
  final String? userEmail;

  /// Creates a question card widget
  ///
  /// [questionData] - Map containing the question details
  /// [userEmail] - Optional email of the current user
  const QuestionCard({
    super.key,
    required this.questionData,
    this.userEmail,
  });

  @override
  Widget build(BuildContext context) {
    // Parse question data into model
    final question = CodingQuestion.fromFirestore('', questionData);

    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header row with difficulty badge and user info
            Row(
              children: [
                // Difficulty level chip
                Chip(
                  label: Text(question.difficultyString),
                  backgroundColor:
                      ThemeHelper.getDifficultyColor(question.difficulty),
                ),
                const Spacer(),

                // User email display
                if (userEmail != null)
                  Text(
                    'Logged in as: $userEmail',
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 12),

            // Question title
            Text(
              question.title,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 16),

            // Question description
            Text(
              question.description,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
