/// Widget for answer submission
///
/// Provides a text input field and submit button for users to submit their
/// answers to coding questions.
library;

import 'package:flutter/material.dart';

/// Input widget for submitting answers to coding questions
///
/// Displays a multi-line text field where users can write their solution
/// or explain their approach, along with a submit button.
class AnswerInput extends StatefulWidget {
  /// Creates an answer input widget
  const AnswerInput({super.key});

  @override
  State<AnswerInput> createState() => _AnswerInputState();
}

class _AnswerInputState extends State<AnswerInput> {
  /// Controller for the answer text field
  final _answerController = TextEditingController();

  /// Handles the answer submission
  ///
  /// Currently shows a success message. In a production environment,
  /// this would save the answer to a database and perform validation.
  void _submitAnswer() {
    if (_answerController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please write an answer before submitting'),
          backgroundColor: Colors.orange,
        ),
      );
      return;
    }

    // Show success feedback
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Answer submitted successfully!'),
        backgroundColor: Colors.green,
      ),
    );

    // Clear the input field after successful submission
    _answerController.clear();
  }

  @override
  void dispose() {
    _answerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section header
        const Text(
          'Your Answer:',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),

        // Multi-line text input for the answer
        TextField(
          controller: _answerController,
          maxLines: 10,
          decoration: const InputDecoration(
            hintText: 'Write your solution here...\n\n'
                'You can use pseudo-code or explain your approach.',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 16),

        // Submit button
        SizedBox(
          width: double.infinity,
          child: ElevatedButton.icon(
            icon: const Icon(Icons.send),
            label: const Text('Submit Answer'),
            onPressed: _submitAnswer,
          ),
        ),
      ],
    );
  }
}
