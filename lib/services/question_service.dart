/// Service for managing coding questions from Firestore
///
/// This service handles all operations related to fetching and managing
/// daily coding questions from the Firebase Firestore database.
library;

import 'package:cloud_firestore/cloud_firestore.dart';

/// Service class for question-related operations
///
/// Provides methods to retrieve and manage coding questions stored
/// in the Firestore database.
class QuestionService {
  /// Private constructor to prevent direct instantiation
  QuestionService._();

  /// Singleton instance of the question service
  static final QuestionService instance = QuestionService._();

  /// Firestore instance for database operations
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /// Name of the questions collection in Firestore
  static const String _questionsCollection = 'questions';

  /// Gets a stream of the latest coding question
  ///
  /// Returns a [Stream] of [QuerySnapshot] that emits updates whenever
  /// the questions collection changes. Limited to the most recent question.
  ///
  /// This stream can be used to build reactive UI that updates automatically
  /// when new questions are added or existing questions are modified.
  Stream<QuerySnapshot> getLatestQuestionStream() {
    return _firestore
        .collection(_questionsCollection)
        .limit(1)
        .snapshots();
  }

  /// Retrieves a single question by its document ID
  ///
  /// [questionId] - The Firestore document ID of the question
  ///
  /// Returns a [Future] that resolves to a [DocumentSnapshot] containing
  /// the question data.
  Future<DocumentSnapshot> getQuestionById(String questionId) async {
    return await _firestore
        .collection(_questionsCollection)
        .doc(questionId)
        .get();
  }
}
