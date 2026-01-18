/// Data model for coding questions
///
/// Represents a daily coding challenge question with all associated metadata.
library;

/// Difficulty levels for coding questions
enum QuestionDifficulty {
  /// Beginner-friendly questions
  easy,

  /// Intermediate difficulty questions
  medium,

  /// Advanced difficulty questions
  hard,
}

/// Model class representing a coding question
///
/// Contains all the data for a single coding challenge including
/// title, description, difficulty level, and any additional metadata.
class CodingQuestion {
  /// Unique identifier for the question
  final String id;

  /// The question title or name
  final String title;

  /// Detailed description of the problem
  final String description;

  /// Difficulty rating of the question
  final QuestionDifficulty difficulty;

  /// Creates a new coding question instance
  ///
  /// All parameters are required to ensure complete question data.
  const CodingQuestion({
    required this.id,
    required this.title,
    required this.description,
    required this.difficulty,
  });

  /// Creates a [CodingQuestion] from a Firestore document
  ///
  /// [id] - The document ID from Firestore
  /// [data] - The document data as a map
  ///
  /// Returns a [CodingQuestion] instance populated with the document data.
  /// Uses default values if required fields are missing.
  factory CodingQuestion.fromFirestore(String id, Map<String, dynamic> data) {
    return CodingQuestion(
      id: id,
      title: data['title'] as String? ?? 'Untitled Question',
      description: data['description'] as String? ?? 'No description available',
      difficulty: _parseDifficulty(data['difficulty'] as String?),
    );
  }

  /// Parses a string difficulty value to [QuestionDifficulty] enum
  ///
  /// Returns [QuestionDifficulty.medium] as the default if the value
  /// is null or doesn't match any known difficulty level.
  static QuestionDifficulty _parseDifficulty(String? difficulty) {
    switch (difficulty?.toLowerCase()) {
      case 'easy':
        return QuestionDifficulty.easy;
      case 'hard':
        return QuestionDifficulty.hard;
      case 'medium':
      default:
        return QuestionDifficulty.medium;
    }
  }

  /// Converts the difficulty enum to a display string
  String get difficultyString {
    switch (difficulty) {
      case QuestionDifficulty.easy:
        return 'Easy';
      case QuestionDifficulty.medium:
        return 'Medium';
      case QuestionDifficulty.hard:
        return 'Hard';
    }
  }
}
