/// Theme and styling utilities
///
/// Provides helper functions for consistent theming throughout the application.
library;

import 'package:flutter/material.dart';
import '../models/coding_question.dart';

/// Helper class for theme-related utilities
///
/// Contains static methods for color mapping and other theme operations.
class ThemeHelper {
  /// Private constructor to prevent instantiation
  ThemeHelper._();

  /// Returns the appropriate color for a given difficulty level
  ///
  /// [difficulty] - The question difficulty level
  ///
  /// Returns a [Color] that visually represents the difficulty:
  /// - Easy: Light green
  /// - Medium: Light orange
  /// - Hard: Light red
  static Color getDifficultyColor(QuestionDifficulty difficulty) {
    switch (difficulty) {
      case QuestionDifficulty.easy:
        return Colors.green.shade100;
      case QuestionDifficulty.medium:
        return Colors.orange.shade100;
      case QuestionDifficulty.hard:
        return Colors.red.shade100;
    }
  }
}
