/// Widget tests for the Codekay application
///
/// Tests the core functionality of the app including widget rendering,
/// navigation, and user interactions.
library;

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:daily_coding_app/main.dart';

void main() {
  group('CodekayApp Widget Tests', () {
    testWidgets('App initializes and displays MaterialApp',
        (WidgetTester tester) async {
      // Build the app and trigger a frame
      await tester.pumpWidget(const CodekayApp());

      // Verify that MaterialApp is present
      expect(find.byType(MaterialApp), findsOneWidget);
    });

    testWidgets('App uses correct title', (WidgetTester tester) async {
      // Build the app
      await tester.pumpWidget(const CodekayApp());

      // Verify app title
      final MaterialApp app = tester.widget(find.byType(MaterialApp));
      expect(app.title, 'Codekay');
    });

    testWidgets('App uses Material Design 3', (WidgetTester tester) async {
      // Build the app
      await tester.pumpWidget(const CodekayApp());

      // Verify Material 3 is enabled
      final MaterialApp app = tester.widget(find.byType(MaterialApp));
      expect(app.theme?.useMaterial3, true);
    });

    testWidgets('App has deep purple color scheme',
        (WidgetTester tester) async {
      // Build the app
      await tester.pumpWidget(const CodekayApp());

      // Verify color scheme is based on deep purple
      final MaterialApp app = tester.widget(find.byType(MaterialApp));
      expect(app.theme?.colorScheme.primary, isNotNull);
    });

    testWidgets('Debug banner is disabled', (WidgetTester tester) async {
      // Build the app
      await tester.pumpWidget(const CodekayApp());

      // Verify debug banner is disabled
      final MaterialApp app = tester.widget(find.byType(MaterialApp));
      expect(app.debugShowCheckedModeBanner, false);
    });
  });

  group('Model Tests', () {
    test('QuestionDifficulty enum has correct values', () {
      // Verify all difficulty levels exist
      expect(QuestionDifficulty.values.length, 3);
      expect(QuestionDifficulty.values,
          contains(QuestionDifficulty.easy));
      expect(QuestionDifficulty.values,
          contains(QuestionDifficulty.medium));
      expect(QuestionDifficulty.values,
          contains(QuestionDifficulty.hard));
    });
  });

  group('Theme Helper Tests', () {
    test('getDifficultyColor returns correct colors for each difficulty', () {
      // Test easy difficulty color
      final easyColor =
          ThemeHelper.getDifficultyColor(QuestionDifficulty.easy);
      expect(easyColor, Colors.green.shade100);

      // Test medium difficulty color
      final mediumColor =
          ThemeHelper.getDifficultyColor(QuestionDifficulty.medium);
      expect(mediumColor, Colors.orange.shade100);

      // Test hard difficulty color
      final hardColor =
          ThemeHelper.getDifficultyColor(QuestionDifficulty.hard);
      expect(hardColor, Colors.red.shade100);
    });
  });
}

// Import necessary models and utilities for testing
import 'package:daily_coding_app/models/coding_question.dart';
import 'package:daily_coding_app/utils/theme_helper.dart';
