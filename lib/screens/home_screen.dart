/// Home screen displaying daily coding questions
///
/// Main application screen shown to authenticated users.
library;

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../services/auth_service.dart';
import '../services/question_service.dart';
import '../widgets/question_card.dart';
import '../widgets/answer_input.dart';
import '../widgets/empty_questions_view.dart';

/// Main home screen of the application
///
/// Displays the daily coding question retrieved from Firestore and allows
/// users to submit their answers. Shows different views based on data state:
/// - Loading indicator while fetching data
/// - Error message if data fetch fails
/// - Empty state if no questions are available
/// - Question card and answer input when data is available
class HomeScreen extends StatelessWidget {
  /// Creates a home screen widget
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = AuthService.instance.currentUser;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Daily Coding Question'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          // Logout button
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'Sign Out',
            onPressed: () => AuthService.instance.signOut(),
          ),
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: QuestionService.instance.getLatestQuestionStream(),
        builder: (context, snapshot) {
          // Show loading indicator while fetching data
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          // Show error message if data fetch failed
          if (snapshot.hasError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.error_outline,
                    size: 64,
                    color: Colors.red,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Error loading questions',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    snapshot.error.toString(),
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                ],
              ),
            );
          }

          // Show empty state if no questions are available
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const EmptyQuestionsView();
          }

          // Extract question data from Firestore document
          final questionDoc = snapshot.data!.docs.first;
          final questionData = questionDoc.data() as Map<String, dynamic>;

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Display the question card
                QuestionCard(
                  questionData: questionData,
                  userEmail: user?.email,
                ),
                const SizedBox(height: 24),

                // Answer input section
                const AnswerInput(),
              ],
            ),
          );
        },
      ),
    );
  }
}
